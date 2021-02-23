[int]$n = Read-Host 'Enter value N'
for ($i = 1; $i -lt $n; $i++)
{
    if ($n % $i -eq 0)
{
Write-Output $i }
}