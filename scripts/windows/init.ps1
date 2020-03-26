# Configure NTP
w32tm /config /manualpeerlist:169.254.169.123 /syncfromflags:manual /update

# Ensure timezone changes persist between reboots
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_DWORD /f

# Remove defender if you are using other AV products
#Uninstall-WindowsFeature Windows-Defender

# In Windows 2019 localhost isn't configured
Add-Content C:\Windows\System32\drivers\etc\hosts "127.0.0.1       localhost"