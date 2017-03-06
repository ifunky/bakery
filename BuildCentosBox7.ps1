# Centos build csript

$env:PACKER_LOG="1"
$env:PACKER_LOG_PATH="centos-7.3.log"
packer\packer.exe build centos-7.3.json
