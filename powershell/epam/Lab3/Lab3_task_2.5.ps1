Get-Process | where {$_.VM -gt 0mb} | Select-Object -Property Name, VM | % {
if($_.VM -gt 100MB) 
    {
        Write-Host $_.Name $_.VM -ForegroundColor Red
    }
    else 
    {
        Write-Host $_.Name $_.VM -ForegroundColor Green
    }
}
