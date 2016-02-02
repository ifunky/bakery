#!/bin/sh

yum install -y ruby
yum install -y gcc g++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel
yum install -y ruby-rdoc ruby-devel
yum install -y rubygems

gem update
gem update –system