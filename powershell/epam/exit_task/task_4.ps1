$hosts = Get-Content 'C:\hosts.txt'
$cred = Get-Credential
Invoke-Command -ComputerName $hosts -Credential $cred -ScriptBlock {
    Get-Service -Name 'wuauserv' | % {
    if ($_.Status -eq 'Running') {
    Write-Host $_.Name, $env:COMPUTERNAME -ForegroundColor Green 
    }
    elseif ($_.Status -eq 'Stopped') {
    Write-Host $_.Name, $env:COMPUTERNAME -ForegroundColor Red
    }
    }    
}
