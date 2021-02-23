$dat= ((Get-Date).AddDays(-7)) 

Get-EventLog 'System' | where {$_.TimeWritten -ge $dat -and $_.EntryType -eq 'error'} | Export-Csv -Path 'C:\event.csv' -Encoding UTF8 

Import-Csv 'C:\event.csv' | ConvertTo-Json 