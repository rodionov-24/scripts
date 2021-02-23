foreach ($tcp in (Get-NetIPConfiguration -InterfaceAlias Беспроводная сеть))
{
   Write-Output $tcp 
}



Get-NetAdapter







Set-NetIPInterface -InterfaceAlias Ethernet -Dhcp Enabled #переключить на получение по dhcp
Restart-NetAdapter -InterfaceAlias Ethernet #перезапустить интерфейс
Get-NetIPConfiguration -InterfaceAlias Ethernet0 #получить иекущие настройки tcp