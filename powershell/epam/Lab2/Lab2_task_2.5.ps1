$a = @(1,4,5,6,0,7,8,9,0)
for ($i=0; $i -lt $a.Length;$i++)
{
    if ($a[$i] -ne 0) 
    {
        $sum+=$a[$i]       
    }
    else
    {
        break
    }
}
Write-Output $sum