if not exist "C:\Windows\Temp\BvSshServer-Inst.exe" (
  powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://dl.bitvise.com.s3-external-3.amazonaws.com/BvSshServer-Inst.exe', 'C:\Windows\Temp\puppet.msi')" <NUL
)

:: http://docs.puppetlabs.com/pe/latest/install_windows.html
msiexec /qn /i C:\Windows\Temp\BvSshServer-Inst.exe /log C:\Windows\Temp\bitvisessh.log

::<nul set /p ".=;C:\Program Files (x86)\Puppet Labs\Puppet Enterprise\bin" >> C:\Windows\Temp\PATH
::set /p PATH=<C:\Windows\Temp\PATH
::setx PATH "%PATH%" /m