if not exist "C:\Windows\Temp\puppet.msi" (
  powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://downloads.puppetlabs.com/windows/puppet-agent-1.6.0-x64.msi', 'C:\Windows\Temp\puppet.msi')" <NUL
)


:: http://docs.puppetlabs.com/pe/latest/install_windows.html
msiexec /qn /i C:\Windows\Temp\puppet.msi PUPPET_MASTER_SERVER=puppet.local PUPPET_AGENT_ENVIRONMENT=vagrant /log C:\Windows\Temp\puppet.log
