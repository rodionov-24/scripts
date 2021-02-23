
function get-servicestatus{
    #input
    $N = (Get-Service | Where-Object Status -eq 'Running' | Select-Object -Last 10)
    $disk = 'C:\'
    $file = 'lab.txt'
    #out    
        $N | Out-File -FilePath "$disk + $file" -Encoding utf8
        
}

get-servicestatus












