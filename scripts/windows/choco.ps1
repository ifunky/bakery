iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

refreshenv

# Globally Auto confirm every action
choco feature enable -n allowGlobalConfirmation