if not exist "C:\Windows\Temp\dotNetFx40_Full_x86_x64.exe" (
  powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://download.microsoft.com/download/9/5/A/95A9616B-7A37-4AF6-BC36-D6EA96C8DAAE/dotNetFx40_Full_x86_x64.exe', 'C:\Windows\Temp\dotNetFx40_Full_x86_x64.exe')" <NUL
)
cmd /c C:\Windows\Temp\dotNetFx40_Full_x86_x64.exe
