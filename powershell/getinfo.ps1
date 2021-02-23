<#
    GetinfoPC
#>
Get-NetAdapter
    $ad= Get-NetAdapter
    Write-Host "Mac-Adress: " -ForegroundColor Yellow
$ad.MacAddress
    Write-Host "Speed: " -ForegroundColor Yellow 
$ad.linkspeed
        $ip=Get-NetIPAddress
    Write-Host "Processor: " -ForegroundColor Yellow
Get-CimInstance -ClassName Win32_Processor | Select-Object -ExcludeProperty "CIM*"
    Write-Host "PC: " -ForegroundColor Yellow
Get-CimInstance -ClassName Win32_ComputerSystem
    Write-Host "Network State: " -ForegroundColor Yellow
$ad | ? status -eq ‘up’ | Get-NetIPAddress -ea 0 | ft ipaddress, interfacealias, prefixorigin -a 
powershell



