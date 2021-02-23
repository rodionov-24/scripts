do { 
    [int]$n = Read-host "Enter value N"
    [int]$m = Read-Host "Enter value M"
   }while ($N -gt $M)

      $sum=0
      for($i=$N; $i -le $m; $i++){
      $sum+=$i
      Write-Output $sum                
                
    }
    "sum=$sum"
       