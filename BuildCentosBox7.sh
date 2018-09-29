#!/usr/bin/env bash
# Centos build script

rm -rf output-virtualbox-iso

export PACKER_LOG=1
export PACKER_LOG_PATH=centos-7.5.log

. packer\packer.exe build centos-7.5.json
