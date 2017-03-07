#!/bin/sh

#  Install pre-reqs for virtualbox
yum install -y bzip2 gcc kernel-devel kernel-headers perl cpp

mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
/mnt/VBoxLinuxAdditions.run --nox11
umount /mnt

yum -y remove gcc kernel-devel kernel-headers perl cpp
rm -rf /home/vagrant/VBoxGuestAdditions.iso

# Remove Virtualbox specific files
#rm -rf /usr/src/vboxguest* /usr/src/virtualbox-ose-guest*
#rm -rf *.iso *.iso.? /tmp/vbox /home/vagrant/.vbox_version