[int]$n = Read-Host 'Enter value N'
[int]$fac = 1;

for($i =1; $i -le $n;$i++)
{
  $fac*=$i;
}

Write-Output $fac
