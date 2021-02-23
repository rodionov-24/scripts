Get-ChildItem -Path 'R:\*txt' | Select-Object -Property Name, LastWriteTimeUtc, CreationTimeUtc | %{
if ($_.LastWriteTimeUtc.Minute -gt $_.CreationTimeUtc.Minute)
{
    Write-Host $_.Name $_.LastWriteTimeUtc $_.CreationTimeUtc
}
}

Get-EventLog -EntryType Error