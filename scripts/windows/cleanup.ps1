Write-Host "Cleaning updates.."

Stop-Service -Name wuauserv -Force
Remove-Item c:\Windows\SoftwareDistribution\Download\* -Recurse -Force
Start-Service -Name wuauserv

try{
	Write-Host "Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase"
	Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
} catch {
	Write-Host "Unable to reset base. Should be ok if patches have been slipstreamed."
}

Write-Host "Removing temp folders"
$tempfolders = @("c:\Temp", "C:\Windows\Temp\*", "C:\Windows\Prefetch\*", "C:\Documents and Settings\*\Local Settings\temp\*", "C:\Users\*\Appdata\Local\Temp\*")
Remove-Item $tempfolders -ErrorAction SilentlyContinue -Force -Recurse

Write-Host "defragging..."
if (Get-Command Optimize-Volume -ErrorAction SilentlyContinue) {
    Optimize-Volume -DriveLetter C
    } else {
    Defrag.exe c: /H
}

Write-Host "0ing out empty space..."
$FilePath="c:\zero.tmp"
$Volume = Get-WmiObject win32_logicaldisk -filter "DeviceID='C:'"
$ArraySize= 64kb
$SpaceToLeave= $Volume.Size * 0.05
$FileSize= $Volume.FreeSpace - $SpacetoLeave
$ZeroArray= new-object byte[]($ArraySize)

$Stream= [io.File]::OpenWrite($FilePath)
try {
   $CurFileSize = 0
    while($CurFileSize -lt $FileSize) {
        $Stream.Write($ZeroArray,0, $ZeroArray.Length)
        $CurFileSize +=$ZeroArray.Length
    }
}
finally {
    if($Stream) {
        $Stream.Close()
    }
}

Del $FilePath

exit 0
