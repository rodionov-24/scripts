$hosts='172.17.187.138'
$cred=Get-Credential
Invoke-Command -ComputerName $hosts -Credential $cred -ScriptBlock {Get-Process | where {$_.CPU -gt 0}}
Invoke-Command -ComputerName $hosts -Credential $cred -ScriptBlock {stop-process -name 'notepad'}