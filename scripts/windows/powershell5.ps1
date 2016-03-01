(New-Object System.Net.WebClient).DownloadFile('http://download.microsoft.com/download/2/C/6/2C6E1B4A-EBE5-48A6-B225-2D2058A9CEFB/Win8.1AndW2K12R2-KB3134758-x64.msu', 'C:\Windows\Temp\Win8.1AndW2K12R2-KB3134758-x64.msu')

start-process wusa -ArgumentList "C:\Windows\Temp\Win8.1AndW2K12R2-KB3134758-x64.msu", "/log:c:\windows\temp\ps5.evtx", "/quiet", "/norestart" -wait

