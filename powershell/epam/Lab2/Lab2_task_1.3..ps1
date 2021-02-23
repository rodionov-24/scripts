$n= Read-Host 'Введите значение n'
$m= Read-Host 'Введите значение m'
$k= Read-Host 'Введите значение k'
if ($k % $m -eq 0 -or $k % $m -eq 0 -and $k -lt $n*$m){
(Write-Host 'true')
}else {
} Write-Host 'false' 