Get-ADUser -Properties mail -Filter {mail -notlike '*'} | Select-Object Name
