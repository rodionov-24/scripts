Import-Csv -Path R:\sh_log.csv | Select-Object -Property TimeWritten, Message, EntryType | % {
if ($_.EntryType -eq 'Information')
{
    Write-Host $_.EntryType $_.Messege $_.TimeWritten -ForegroundColor White
}
elseif ($_.EntryType -eq 'warning')
{
    Write-Host $_.EntryType $_.Messege $_.TimeWritten -ForegroundColor Yellow

}
elseif ($_.EntryType -eq 'Error')
{
    Write-Host $_.EntryType $_.Messege $_.TimeWritten -ForegroundColor Red
}
}