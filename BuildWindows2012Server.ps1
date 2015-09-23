$env:PACKER_LOG="1" 
$env:PACKER_LOG_PATH="windows_2012_r2.log"
packer\packer.exe build windows_2012_r2.json
