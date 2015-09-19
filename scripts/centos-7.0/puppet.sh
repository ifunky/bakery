#!/bin/bash
rpm -ivh rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum -y install puppet-agent
PATH=/opt/puppetlabs/bin:$PATH;export PATH