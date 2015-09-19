Windows and Centos Bakery for Puppet 4.0
----------------------------------------

The "Bakery" is a set of scripts for creating Centos and Windows boxes primarily designed for developing locally with Puppet  and Windows.  This initial version will use traditional virtual boxes but going forward I'll convert these to use docker.

**Getting started on your Windows Desktop**
Currently these scripts are working with the following versions:
 - Windows 8.1 (not tested on Windows 10)
 - Packer 0.8.6 (included in source)
 - Virtual Box 4.3.30
 - Vagrant 1.7.4

Prerequisites
 1. Install git bash
 2. Install Oracle Virtual Box from https://www.virtualbox.org/wiki/Downloads
 2. Install Vagrant from http://www.vagrantup.com/downloads.html

Creating a Base Centos 7 Box
-------
This box will be setup with the following:

 - Centos 7
 - Ruby 2.1.0
 - Puppet agent 4.0
 - Selinux disabled

 1. Clone the git repo into a folder
 2. Run BuildCentos7.bat
 3. After the build has completed you'll find a centos-7.1.box on the root of the bakery folder.


SSH To The Centos Box
---------------------
If you want to easily get onto the box there is a vagrant file already created.
From the bakery folder in a **git bash command prompt**:

 1. `$ vagrant up centos`
 2. `$ vagrant ssh centos`
 3. At this point you should have a shell in the new server!


