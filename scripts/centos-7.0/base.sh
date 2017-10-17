#!/bin/bash

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

if [ ! -z "$http_proxy" ]; then
    echo "proxy=$http_proxy" >> /etc/yum.conf

    # set global http/https proxy environment variables
    touch /etc/profile.d/proxy.sh
    echo "export http_proxy=$http_proxy" >> /etc/profile.d/proxy.sh
    echo "export https_proxy=$http_proxy" >> /etc/profile.d/proxy.sh
fi

if [ ! -z "$no_proxy" ]; then
    echo "export no_proxy=$no_proxy" >> /etc/profile.d/proxy.sh
fi

yum update -y

yum -y install epel-release
yum -y --enablerepo epel install dkms

echo "Rebooting..."
reboot
exit 0