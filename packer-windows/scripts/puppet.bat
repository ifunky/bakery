 if not exist "C:\Windows\Temp\puppet.msi" (
  powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://downloads.puppetlabs.com/windows/puppet-3.7.3-x64.msi', 'C:\Windows\Temp\puppet.msi')" <NUL
)


:: http://docs.puppetlabs.com/pe/latest/install_windows.html
msiexec /qn /i C:\Windows\Temp\puppet.msi PUPPET_MASTER_SERVER=puppet.b2b.regn.net PUPPET_AGENT_ENVIRONMENT=vagrant /log C:\Windows\Temp\puppet.log

:: TODO // Its temp solution has to be removed after some time.
if not exist "C:\programdata\PuppetLabs\facter\facts.d\standalone.txt" (
  powershell -Command "New-Item C:\programdata\PuppetLabs\facter\facts.d\standalone.txt -type file -force -value standalone=true" <NUL 
)

:: SSL will will create after 20 seconds. So wait till 30 seconds and then removed ssl files
powershell -Command "Start-Sleep -s 30" <NUL


if exist "C:\programdata\PuppetLabs\puppet\etc\ssl" (
  powershell -Command "Get-ChildItem -Path C:\programdata\PuppetLabs\puppet\etc\ssl -Recurse | Remove-Item -force -recurse" <NUL
                                                     )
 

::<nul set /p ".=;C:\Program Files (x86)\Puppet Labs\Puppet\bin" >> C:\Windows\Temp\PATH
::set /p PATH=<C:\Windows\Temp\PATH
::setx PATH "%PATH%" /m
