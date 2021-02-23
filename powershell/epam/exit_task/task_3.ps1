[int]$a = Read-host "Enter value A"
[int]$b = Read-Host "Enter value B"
[int]$n = Read-Host "Enter value N"
for($i = $a; $i -le $b; $i++){
    if ($i % $n -eq 0){
    Write-Host $i
    }
}