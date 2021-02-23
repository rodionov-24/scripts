$god= Read-Host 'Введите год'
if ($god % 4 -eq 0 -and $god % 100 -ne 0){
Write-Host "Год високосный"}
else {Write-Host "год не високосный"}
