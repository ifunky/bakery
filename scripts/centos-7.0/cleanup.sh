#!/bin/sh

yum -y clean all

# clean history
history -c

# Cleanup log files
find /var/log -type f | while read f; do echo -ne '' > $f; done;

# remove under tmp directory
rm -rf /tmp/*

# remove interface persistent
rm -f /etc/udev/rules.d/70-persistent-net.rules

dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY