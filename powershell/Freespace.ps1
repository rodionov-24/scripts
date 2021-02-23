#Мониторинг свободного места и проверка


#$S=Get-Volume
#объявляем переменную
#Get-Volume  -DriveLetter C
#Получаем информацию о разделе
#Write-Host "Информация" -ForegroundColor Yellow
#Выводим информацию
#$S | Out-GridView 
#Выводим информацию в текстовый файл
#get-childitem C:\DiskSpace_Report\* -include *.html -recurse | remove-item

# Параметры предупреждений в %
$percentWarning = 15
$percentCritcal = 5

# Путь для хранения отчета
$reportPath = "C:\scripts\";

# Имя файла отчета
$reportName = "Log.html";

$diskReport = $reportPath + $reportName

$redColor = "#FF0000"
$orangeColor = "#FBB917"
$whiteColor = "#FFFFFF"

$i = 0;

# Список компьютеров для отчета
$computers = "172.26.181.1", "10.0.0.9", "172.26.181.10";
$datetime = Get-Date -Format "yyyy_MM-dd";

#E-mail settings
$SMTPServer = "email.farmin.by"
$SMTPPort = "587"
$Username = "rp@farmin.by"
$Password = "heynze123map145/"
$to = "monitoring@farmin.by"
$subject = "Servers Disks Space monitoring"
$body = "Файл лога во вложении"

$titleDate = get-date -uformat "%d-%m-%Y"
$header = "
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>DiskSpace Report</title>
<STYLE TYPE='text/css'>
<!--
td {
font-family: Tahoma;
font-size: 11px;
border-top: 1px solid #999999;
border-right: 1px solid #999999;
border-bottom: 1px solid #999999;
border-left: 1px solid #999999;
padding-top: 0px;
padding-right: 0px;
padding-bottom: 0px;
padding-left: 0px;
}
body {
margin-left: 5px;
margin-top: 5px;
margin-right: 0px;
margin-bottom: 10px;
table {
border: thin solid #000000;
}
-->
</style>
</head>
<body>
<table width='100%'>
<tr bgcolor='#CCCCCC'>
<td colspan='7' height='25' align='center'>
<font face='tahoma' color='#003399' size='4'><strong>Servers DiskSpace Report for $titledate</strong></font>
</td>
</tr>
</table>
"
Add-Content $diskReport $header

$tableHeader = "
<table width='100%'><tbody>
<tr bgcolor=#CCCCCC>
<td width='10%' align='center'>Server</td>
<td width='5%' align='center'>Drive</td>
<td width='15%' align='center'>Drive Label</td>
<td width='10%' align='center'>Total Capacity(GB)</td>
<td width='10%' align='center'>Used Capacity(GB)</td>
<td width='10%' align='center'>Free Space(GB)</td>
<td width='10%' align='center'>Freespace %</td>
</tr>
"
Add-Content $diskReport $tableHeader

foreach($computer in $Computers)
{
$disks =Get-WmiObject -ComputerName $Computer -Class Win32_LogicalDisk -Filter "DriveType=3"
$computer = $computer.toupper()
foreach($disk in $disks)
{
$deviceID = $disk.DeviceID;
$volName = $disk.VolumeName;
[float]$size = $disk.Size;
[float]$freespace = $disk.FreeSpace;
$percentFree = [Math]::Round(($freespace / $size) * 100, 2);
$sizeGB = [Math]::Round($size / 1073741824, 2);
$freeSpaceGB = [Math]::Round($freespace / 1073741824, 2);
$usedSpaceGB = $sizeGB - $freeSpaceGB;
$color = $whiteColor;

if($percentFree -lt $percentWarning)
{
$color = $orangeColor

if($percentFree -lt $percentCritcal)
{
$color = $redColor
}

$dataRow = "
<tr>
<td width='10%'>$computer</td>
<td width='5%' align='center'>$deviceID</td>
<td width='15%' >$volName</td>
<td width='10%' align='center'>$sizeGB</td>
<td width='10%' align='center'>$usedSpaceGB</td>
<td width='10%' align='center'>$freeSpaceGB</td>
<td width='5%' bgcolor=`'$color`' align='center'>$percentFree</td>
</tr>
"
Add-Content $diskReport $dataRow;
Write-Host -ForegroundColor DarkYellow "$computer $deviceID,percentage,free_space = $percentFree";
$i++
}
}
}

$tableDescription = "
</table><br><table width='20%'>
<tr bgcolor='White'>
<td width='10%' align='center' bgcolor='#FBB917'>Warning less than 15% free space</td>
<td width='10%' align='center' bgcolor='#FF0000'>Critical less than 5% free space</td>
</tr>
"
Add-Content $diskReport $tableDescription
Add-Content $diskReport "</body></html>"

if ($i -gt 0)

{
Write-Host "Sending Email notification"

$file = "$reportPath\DiskSpaceRpt.html"
$message = New-Object System.Net.Mail.MailMessage
$message.subject = $subject
$message.body = $body
$message.to.add($to)
$message.from = $username
$message.attachments.add($file)

$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
$smtp.send($message)
}


 















