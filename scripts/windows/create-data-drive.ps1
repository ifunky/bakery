# Get-Diskk needs the "Microsoft Storage Spaces SMP" service to be running otherwise it won't return anything

Start-Service smphost

# Show disks
Get-Disk

# Initialise all new disks to GPT
Get-Disk | Where partitionstyle -eq ‘raw’ | Initialize-Disk -PartitionStyle GPT

# Set up the D Data drive
#Get-disk | Where-Object Number -Eq "1" | New-Partition -DriveLetter D  -UseMaximumSize | Format-Volume -NewFileSystemLabel "Data" -confirm:$false