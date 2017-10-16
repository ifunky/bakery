mkdir c:\temp
dir f:

$from = "f:\*"
$to = "c:\temp"
Copy-Item $from $to -recurse


Write-Host 'Installing certs'
$files = Get-ChildItem c:\temp\cert\*.cer
foreach ($file in $files) { & c:\temp\cert\VBoxCertUtil.exe add-trusted-publisher $file --root $file }

Write-Host 'Installing Guest Additions'
& c:\temp\VBoxWindowsAdditions.exe /S /I

Write-Host "Sleeping for 60 seconds so we are sure the tools are installed before reboot"
Start-Sleep -s 60
