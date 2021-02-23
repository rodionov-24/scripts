foreach ($a in Get-Service | Where-Object {$_.Status -EQ "Running"})
{
    Write-Output $a
}