Import-Clixml -Path 'C:\PS_RADZIVONAU\disk.xml' | % {
$ID= $_.DeviceID
$freespace= $_.FreeSpace
$freespaceGB=[Math]::Round($_.FreeSpace / 1073741824, 2);
$percentFree=[Math]::Round(($freespace / $_.Size) * 100, 2);
}
 Write-Host Name -ForegroundColor Green $ID Space $freespaceGB GB $percentFree%

