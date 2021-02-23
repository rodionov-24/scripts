Get-VM | Select-Object -Property Name, State | % {
switch ($_.State) {   
1 {'Running'}
2 {'Off'}
 }
 Write-Host $_.Name $_.State  -ForegroundColor Red
 Write-Host $_.Name $_.State  -ForegroundColor Green
 Write-Host $_.Name $_.State -ForegroundColor Yellow
 }
  

