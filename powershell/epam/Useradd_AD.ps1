$users = Import-Csv -Delimiter ";" -Path "C:\Users.csv"
foreach ($newuser in $users)
{
    $Displayname = $newuser.FirstName + " " +$newuser.LastName
    $UserFirstname = $newuser.FirstName
    $UserLastname = $newuser.LastName
    $ou = 'OU=LAB_Users,DC=RR,DC=lab'
    $password = $newuser.DefaultPassword
    $depp = $newuser.Department

New-ADUser -Name "$Displayname" `
-DisplayName "$Displayname" `
-GivenName "$UserFirstname" `
-Surname "$UserLastname" `
-AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -Enabled $true `
-Path "$OU" `
-Department "$depp"

}
