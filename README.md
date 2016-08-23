
Windows and Centos Bakery for Puppet 4.0
----------------------------------------

The "Bakery" is a set of scripts for creating Centos and Windows boxes primarily designed for developing locally with Puppet  and Windows.  This initial version will use traditional virtual boxes but going forward I'll convert these to use docker.

**Getting started on your Windows Desktop**
Currently these scripts are working with the following versions:
 - Windows Windows 10
 - Packer 0.10.1 (included in source)
 - Virtual Box 5.1.4
 - Vagrant 1.8.5

Prerequisites
 1. Install git bash (check option to update system PATH)
 2. Install Oracle Virtual Box from https://www.virtualbox.org/wiki/Downloads
 3. Install Vagrant from http://www.vagrantup.com/downloads.html
   
Creating a Base Centos 7 Box
-------
This box will be setup with the following:

 - Centos 7
 - Ruby 2.1.0
 - Puppet agent 4.0
 - Selinux disabled

 1. Clone the git repo into a folder
 2. Run BuildCentos7.ps1
 3. After the build has completed you'll find a centos-7.1.box on the root of the bakery folder. 
 

SSH To The Centos Box
---------------------
If you want to easily get onto the box there is a vagrant file already created.   
From the bakery folder in a **git bash command prompt**:

 1. `$ vagrant up centos`
 2. `$ vagrant ssh centos`
 3. At this point you should have a shell in the new server!

Create a Windows 2012 R2 Virtual Box
------------------------------------

This box will be setup with the following:
- Windows 2012 R2
- Powershell 5

Before you get started you're going to need an iso image which you'll copy into the /iso folder.  

**Windows 2012 ISO Sources**

Source        | ISO Checksum (SHA1)
------------- | -------------------
[MSDN Subscriber Downloads](https://msdn.microsoft.com/subscriptions/json/GetDownloadRequest?brand=MSDN&locale=en-US&fileId=62611&activexDisabled=true&akamaiDL=false)    | 865494E969704BE1C4496D8614314361D025775E
[180 day Trial](http://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2012-r2)  | 5e2ddcaecc91e80a8ce3ec7ae7838f8a3967ed7f

Configure Keys and ISO Locations
------------------------------------
**Trial ISO**

If you are using the trial you can modify the windows_2012_r2.json template with the following line:
`"iso_url": "http://care.dlservice.microsoft.com/dl/download/6/2/A/62A76ABB-9990-4EFC-A4FE-C7D698DAEB96/9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_EN-US-IR3_SSS_X64FREE_EN-US_DV9.ISO"`

In order for the trial to work make sure answer_files\2012_r2Autoattend.xml has a blank product key by commenting it out:
`<UserData>
    <ProductKey>
         <!--<Key></Key>-->
         <WillShowUI>OnError</WillShowUI>
     </ProductKey>
     <AcceptEula>true</AcceptEula>
     <FullName>Vagrant</FullName>
     <Organization>Vagrant</Organization>
</UserData>`

**MSDN Subscriber ISO**

If you have downloaded a MSDN subscriber iso then make sure the windows_2012_r2.json template contains the correct iso path:
`"iso_url": "iso/en_windows_server_2012_r2_with_update_x64_dvd_6052708.iso"`

Update answer_files\2012_r2Autoattend.xml with your product key:
`<UserData>
    <ProductKey>
         <Key>ABCDE-AB9TW-ABW8V-AB6H7-AB3WM</Key>
         <WillShowUI>OnError</WillShowUI>
     </ProductKey>
     <AcceptEula>true</AcceptEula>
     <FullName>Vagrant</FullName>
     <Organization>Vagrant</Organization>
</UserData>`

**ISO Checksum (subscriber and trial)**
For all iso images make sure you update the `iso_checksum` value using the values in the table above.

Bake a server! 

1.  Run BuildWindows2012Server.ps1

Spin it up

1. vagrant up win2012
