Add-Content -Path C:\Users.csv -Value "FirstName;LastName;Department;DefaultPassword" 

$users = @(

  'Roman;Radzivonau;DevOps;Santaclaus123'

  'Palina;Radzivonava;Sales;Santaclaus123'

  'Nikolai;Semeaniaka;Marketing;Santaclaus123'

  'Natalia;Korol;Software;Santaclaus123'

  )

  $users | foreach { Add-Content -Path  C:\users.csv -Value $_ }  