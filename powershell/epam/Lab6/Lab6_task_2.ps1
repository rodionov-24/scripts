$t=$null
(Get-WmiObject -Class Win32_PingStatus -Filter  "Address='8.8.8.8'").ResponseTime | % {
$t+$_
}
Write-Host Ping time "$t"

