$hosts=@("172.17.178.90","172.17.187.138","172.17.180.224") 
$cre= Get-Credential 
Get-WmiObject win32_OperatingSystem -ComputerName $hosts -Credential $cre | 
Invoke-WmiMethod -Name Reboot 