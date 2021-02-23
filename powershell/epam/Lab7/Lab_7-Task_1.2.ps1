$cre= Get-Credential 
Get-WmiObject win32_service -ComputerName '172.17.178.90' -Credential $cre | 
Get-Service | where {$_.status -eq 'running'}