$cred=Get-Credential
$hosts=@("172.17.178.90","172.17.187.138","172.17.180.224") 
Invoke-Command -ComputerName $hosts -Credential $cred -ScriptBlock {Get-Service | where {$_.Status -eq 'running'}}