.SHELL := /usr/bin/bash

help:
	@grep -E '^[a-zA-Z_-_\/]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo "--------------------------------------------------------------------------- \
	\nHow to use: \
	\nExport the following varibles to \
	\n \
	\nexport AWS_PROFILE=my-aws-creds \
	\nexport REGION=eu-west-1 \
	\nexport VPC_NAME=MY-VPC \
	\nexport SUBNET_NAME=My-Subnet \
	\nexport DESTINATION_REGIONS=eu-west-1"

prep: #- Internal usage for checking required variables have been set
	@if [ -z "${AWS_PROFILE}" ]; then \
       echo "AWS_PROFILE' environment variable isn't set.";\
       exit 1;\
    fi\


build/ubuntu: prep ## Build ubuntu AMI
	@aws-vault exec --duration 4h ${AWS_PROFILE} -- docker run --rm -i \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
    -e AWS_SESSION_TOKEN \
    -e AWS_SECURITY_TOKEN \
    --env AWS_DEFAULT_REGION=${REGION} \
    -v "$$PWD:/data" \
    ifunky/polydev:latest \
    packer build \
	-var "region=${REGION}" \
	-var "vpc_name=${VPC_NAME}" \
	-var "subnet_name=${SUBNET_NAME}" \
	-var "destination_regions=${DESTINATION_REGIONS}" \
	/data/templates/linux/ubuntu-18-04.json

build/windowsbase: prep ## Build Windows 2019 base AMI - no services
	@aws-vault exec --duration 4h ${AWS_PROFILE} -- docker run --rm -i \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
    -e AWS_SESSION_TOKEN \
    -e AWS_SECURITY_TOKEN \
    --env AWS_DEFAULT_REGION=${REGION} \
    -v "$$PWD:/data" \
    ifunky/polydev:latest \
    packer build \
	-var "region=${REGION}" \
	-var "vpc_name=${VPC_NAME}" \
	-var "subnet_name=${SUBNET_NAME}" \
	-var "destination_regions=${DESTINATION_REGIONS}" \
	/data/templates/windows/windows_2019_base.json

build/windowsweb: prep ## Build Windows 2019 AMI with IIS installed
	@aws-vault exec --duration 4h ${AWS_PROFILE} -- docker run --rm -i \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
    -e AWS_SESSION_TOKEN \
    -e AWS_SECURITY_TOKEN \
    --env AWS_DEFAULT_REGION=${REGION} \
    -v "$$PWD:/data" \
    ifunky/polydev:latest \
    packer build \
	-var "region=${REGION}" \
	-var "vpc_name=${VPC_NAME}" \
	-var "subnet_name=${SUBNET_NAME}" \
	-var "destination_regions=${DESTINATION_REGIONS}" \
	/data/templates/windows/windows_2019_web.json