#!/bin/sh
yum groupinstall -y development
command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -L get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm install 2.1.0
rvm use 2.1.0
ruby --version