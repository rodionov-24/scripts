$folderpath_data = "E:\newinstance\MSSQL"
New-Item -ItemType Directory -Path $folderpath_data

$folderpath_log = "F:\newinstance\MSSQL"
New-Item -ItemType Directory -Path $folderpath_log

& H:\setup.exe /Q `
/IACCEPTSQLSERVERLICENSETERMS `
/ACTION="INSTALL" `
/FEATURES=SQLEngine `
/INSTANCENAME=NEWINSTANCESQL `
/SECURITYMODE=SQL `
/SAPWD="Santaclaus123" `
/SQLSYSADMINACCOUNTS="Administrator" `
/SQLUSERDBDIR=$folderpath_data `
/SQLUSERDBLOGDIR=$folderpath_log