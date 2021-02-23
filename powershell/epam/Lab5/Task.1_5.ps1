Get-ChildItem -Path 'C:\PS_RADZIVONAU\*txt' | Export-Csv 'C:\export.csv'
Get-WmiObject -Class Win32_LogicalDisk | Export-Clixml C:\disk.xml
Import-Csv -Path C:\export.csv | % {
Write-Host ($_ | Out-String) -ForegroundColor red
Write-Host ($_ | Out-String) -ForegroundColor yellow
Write-Host ($_ | Out-String) -ForegroundColor green
}
Start-Sleep -Seconds 15