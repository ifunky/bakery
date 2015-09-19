if not exist "C:\Windows\Temp\Windows6.1-KB2506143-x64.msu" (
  powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.1-KB2506143-x64.msu', 'C:\Windows\Temp\Windows6.1-KB2506143-x64.msu')" <NUL
)

cmd /c C:\Windows\system32\wusa.exe C:\Temp\Windows6.1-KB2506143-x64.msu /quiet /norestart
