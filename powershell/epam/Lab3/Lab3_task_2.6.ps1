$dat= (Get-Date).AddDays(-3) ## неактивные пользователи за 3 дня
Get-LocalUser | Sort-Object Name | % {
if ($_.LastLogon -lt $dat) 
{
    
    Write-Host $_.LastLogon $_.Name -ForegroundColor Red   
}
else
{
    Write-Host $_.LastLogon -ForegroundColor Green
}

}
