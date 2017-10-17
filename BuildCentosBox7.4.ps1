# Centos build script

Remove-Item output-virtualbox-iso -Force -Recurse -ErrorAction Ignore

$env:PACKER_LOG="1"
$env:PACKER_LOG_PATH="centos-7.4.log"
packer\packer.exe build centos-7.4.json
