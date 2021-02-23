Function mask_addr {

param (

     [parameter(Mandatory=$true)]

     [Net.IPAddress]

     $ipaddress1,

     [parameter(Mandatory=$true)]

     [Net.IPAddress]

     $ipaddress2,

     [parameter()]

     [Net.IPAddress]

     $mask='255.255.255.0'

)

 if (($ipaddress1.address -band $mask.address) -eq ($ipaddress2.address -band $mask.address)) {
 Write-Host 'Адреса в одной подсети' -ForegroundColor green
 }
 else {Write-Host 'Адреса в разных подсетях' -ForegroundColor Red} 

} 