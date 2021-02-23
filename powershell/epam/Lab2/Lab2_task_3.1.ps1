$sum=0
foreach ($a in (Get-ChildItem -Name *.ps1 -Path C:\epam\Powershell\scripts))
{
    $a.Length
    $sum+=$a.Length
}

Write-Host $sum