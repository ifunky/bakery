Write-Host 'Installing certs'
$files = Get-ChildItem f:\cert\*.cer
foreach ($file in $files) { & f:\cert\VBoxCertUtil.exe add-trusted-publisher $file --root $file }

Write-Host 'Installing Guest Additions'
& f:\VBoxWindowsAdditions.exe /S /I

Write-Host "Sleeping for 60 seconds so we are sure the tools are installed before reboot"
Start-Sleep -s 60
