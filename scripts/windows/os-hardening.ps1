Expand-Archive C:\Windows\Temp\Windows2019SecurityBaseline.zip -DestinationPath C:\Windows\Temp\Windows2019SecurityBaseline

cd C:\Windows\Temp\Windows2019SecurityBaseline\Local_Script

# Use non domain joined during AMI building otherwise it fails
./BaselineLocalInstall.ps1 -WS2019NonDomainJoined