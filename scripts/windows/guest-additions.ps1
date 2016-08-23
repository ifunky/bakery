write-host "Copying cert...."
certutil -addstore -f "TrustedPublisher" A:\oracle-cert.cer

write-host "Installing.VBoxWindowsAdditions.exe..."

# Determine the drive that guest additions are mapped to i.e. F:
$drive = GET-WMIOBJECT win32_logicaldisk | Where-Object {$_.VolumeName -match "VBOXADD*" } | Select-Object "DeviceID"
$driveLetter = $drive.DeviceID
& "$driveLetter\VBoxWindowsAdditions.exe" /S

Write-host "Sleeping for checks...."
start-sleep -s 100