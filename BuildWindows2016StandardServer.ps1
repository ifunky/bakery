$env:PACKER_LOG="1" 
$env:PACKER_LOG_PATH="windows_2016_standard.log"
packer\packer.exe build windows_2016_standard.json
