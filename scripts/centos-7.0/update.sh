#!/bin/bash

#yum -y install dkms patch
yum update -y

yum -y install epel-release
yum -y --enablerepo epel install dkms
reboot
sleep 60