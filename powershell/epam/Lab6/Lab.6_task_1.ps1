Get-WmiObject -Class Win32_LogicalDisk | % {
$Device = $_.DeviceID
[float]$freespace = $_.FreeSpace
[float]$freeSpaceGB = [Math]::Round($freespace / 1073741824, 2);
Write-Host Device: $Device -ForegroundColor Green ("free: $freeSpaceGB")
$sum+=$freeSpaceGB
}
Write-Host $sum -ForegroundColor red