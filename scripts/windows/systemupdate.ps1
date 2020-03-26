Import-Module PowerShellGet
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Scope CurrentUser
Set-PSRepository -InstallationPolicy Trusted -Name PSGallery
Install-Module PSWindowsUpdate -Force -Scope CurrentUser
import-module PSWindowsUpdate
Get-WindowsUpdate

Install-WindowsUpdate -AcceptAll -IgnoreReboot

