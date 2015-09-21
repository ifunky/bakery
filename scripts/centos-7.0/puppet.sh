#!/bin/bash
rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum -y install puppet-agent

# Add puppet bin path to global profile for all users
echo 'pathmunge /opt/puppetlabs/bin' > /etc/profile.d/puppet.sh
chmod +x /etc/profile.d/puppet.sh
#PATH=/opt/puppetlabs/bin:$PATH;export PATH