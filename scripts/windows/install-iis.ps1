Install-WindowsFeature -name Web-Server -IncludeManagementTools

# Install the dotnet core hosting module
choco install dotnetcore-windowshosting

# Open ports on the firewall
netsh advfirewall firewall add rule name="HTTP Traffic" dir=in action=allow protocol=TCP localport=80
netsh advfirewall firewall add rule name="HTTPS Secure Traffic" dir=in action=allow protocol=TCP localport=443