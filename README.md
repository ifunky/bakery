# iFunky Cloud AWS Bakery

The bakery is the place to bake AMIs :-) Using Packer we can create baseline images for Windows and Linux.  

## Windows

All windows servers are configured with Microsoft Security Compliance Toolkit: https://docs.microsoft.com/en-us/windows/security/threat-protection/security-compliance-toolkit-10

To see the latest AWS Windows AMIs with patches see here: https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/windows-ami-version-history.html#amis-2019

### Base Server

- Windows 2019 server with latest Microsoft updates installed
- AWS Agent Service (security CVE scanning)
- D: "data" drive
- Security hardened
- Minimal install
- Windows Updates disabled

### Web Server

- Windows 2019 web server with latest Microsoft updates installed
- AWS Agent Service (security CVE scanning)
- IIS installed and configured with the .NET Core Hosting Bundle
- D: "data" drive
- Security hardened
- Windows Updates disabled (for enterprises that control the rollout out of updates)

### Windows Sysprep

All Windows images are run the EC2 sysprep command which will set a new random password which is retrievable via the console.

An `unattend.xml` file is uploaded to the target server which contains information used in the sysprep process and this is where the system locale is set to `en-GB`.
For more detailed information see the AWS Windows guide: [https://docs.aws.amazon.com/en_pv/AWSEC2/latest/WindowsGuide/ami-create-standard.html](https://docs.aws.amazon.com/en_pv/AWSEC2/latest/WindowsGuide/ami-create-standard.html)

__NOTE:__ It is advisable to perform a system restart just before running the sysprep commands as it will hang if a reboot is pending from earlier scripts.

## Linux

### Ubuntu 18.04

- Latest updates

  ------

  


## Building AMIs

The Bakery contains a Makefile with targets that are designed to be used within an automation tool or optionally can also be run from your local desktop.

### Prerequisites
Our recommended best practice approach is to use AWS Users, Roles and Groups along with `aws-vault` from your desktop which provides better security (no clear text keys) and makes it easy to assume IAM roles.

- Follow Amazons best practice guide here to setup your IAM Roles: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html
- The following environment variables are required to be set:

````bash
export AWS_PROFILE=my-aws-creds
export REGION=eu-west-1
export VPC_NAME=MY-VPC
export SUBNET_NAME=My-Subnet
export DESTINATION_REGIONS=eu-west-1, us-west-1       # List of regions to copy the iamge
````
__NOTE:__ *VPC and SUBNETS use a name not ID!*

#### **Running The Bakery From Your Local Desktop**

The Bakery is designed to be used with Docker so no local installation of Packer is required - just an image with with the correct Packer version :-)

1. Install and configure `aws-vault` from here: https://github.com/99designs/aws-vault

2. Once configured you should have something like this in your `/.aws/config`file:

```ini
   [profile ifunky-ro]
   region=eu-west-1
       
   [profile ifunky-prod]
   source_profile=ifunky-ro
   region=eu-west-1
   role_arn=arn:aws:iam::1235467890:role/account_admins
```
3. Running Packer


````bash
$ make build/ubuntu1804

# Or build Windows, for example
$ make build/windowsweb
````

## Finding AMIs

To find suitable AMIs use the AWS CLI to query images.

```bash

aws ec2 describe-images --owners self amazon --filters "Name=name,Values=Windows_Server-2019-English-Full-Base-20*"

```

### Long AMI Builds

If you need to run a long AMI build the default assume session role is 1h, if you need longer use the --no-session:

```bash

@aws-vault exec --assume-role-ttl 4h --no-session {your_profile} -- ./packer build windows_2019_simple.json

```

### Automated Builds - Extracting the AMI ID

This solution has been designed to be integrated into external tooling and each run of an AMI build will create a manifest file which will contain the new AMI ID which can be extracted if you need to take further actions on your new image.

Use the following example in your script:

````bash
MANIFEST_NAME="my-server-template.manifest"
AMI_ID=$(egrep -m1 -oe 'ami-.{8}' $MANIFEST_NAME)

````


## Makefile Targets

The following targets are available which are used to build servers:

```bash
build/ubuntu 		Build Ubuntu 18.04 AMI
build/windowsbase 	Build Windows 2019 base AMI - no services
build/windowsweb 	Build Windows 2019 AMI with IIS installed

```

------



## License

Apache 2 Licensed. See LICENSE for full details.

```

```

```