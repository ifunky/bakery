$env:PACKER_LOG="1" 
$env:PACKER_LOG_PATH="windows_2016.log"
packer\packer.exe build windows_2016.json
