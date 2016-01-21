#!/bin/sh

# Disable IPV6
#echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
#echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf

yum -y clean all

# Cleanup log files
find /var/log -type f | while read f; do echo -ne '' > $f; done;

# remove under tmp directory
rm -rf /tmp/*

# remove interface persistent
rm -f /etc/udev/rules.d/70-persistent-net.rules

dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY