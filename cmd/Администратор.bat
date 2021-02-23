chcp 65001
rem Переводит командную строку в кодировку UTF-8 
@echo off
rem Синхронизация времени с office.farmin.by
echo add NTP server  
echo start service w32time
net start w32time
echo change parametrs service
sc config w32time start= auto
echo add server NTP office.farmin.by
w32tm /config /syncfromflags:manual /manualpeerlist:office.farmin.by
echo update server NTP
w32tm /config /update
echo reboot service
net stop w32time
net start w32time
echo sync time
w32tm /resync
echo real time
w32tm /query /status
echo query state timezone 
WMIC Path Win32_TimeZone Get StandardName
c:\farmin\install\work\tzutil.exe /s "Kaliningrad Standard Time"
echo
rem отключение ipv-6
 reg import c:\farmin\install\work\ipv6.reg
rem установка прав на запуск приложений msi
 reg add HKLM\Software\Policies\Microsoft\Windows\Installer /v DisableMSI /t REG_DWORD /d 0x0 /f
 rem изменение локальной политики для сложности пароля
 echo setting local policy
 secedit /configure /cfg c:\farmin\install\work\secpol.txt /db c:\farmin\install\work\newpol.sdb
 secedit /configure /db c:\farmin\install\work\_newpol.sdb /areas SECURITYPOLICY
rem подключаем сетевой диск
net use i: \\10.0.0.254\install /user:user 123123
rem установка антивируса NOD32
echo installing nod32
"i:\Antivirus\nod32 v4\eavbe_nt64_rus.msi" /qn ADMINCFG="c:\farmin\install\work\apteka.xml"
 create folder for sql server
rem создает папки для базы данных
echo creating directories for sql server
mkdir d:\base
mkdir d:\log
mkdir d:\backup
mkdir d:\data
rem изменение пароля Администратор и создание пользователей Sql и Заведующая
 net user Администратор santaclaus
 net user sql santaclaus /add
net user sql santaclaus /add
  WMIC USERACCOUNT WHERE Name="sql" SET PasswordExpires=FALSE
 REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v "sql" /t REG_DWORD /d 0 /f 
   net user Заведующая 12345678 /add
   net localgroup Администраторы Заведующая /add
 rem установка SQL сервера
 install sql server
"i:\MS SQL SERVER\ms sql2008R2\setup.exe" /configurationfile=c:\farmin\install\work\ConfigurationFile.ini
 echo install cmdsql
 c:\farmin\install\work\MsSqlCmd.msi /quite
rem копируем шаблон базы данных
echo copy database
xcopy "i:\nyll\Программы для установки на сервере Аптеки\БД SQL\aptekajet.bak" c:\farmin\
rem перезапуск службы и установка скриптов
echo restart mssql
net stop sqlserveragent && net stop mssqlserver && net start mssqlserver && net start sqlserveragent
echo executing sql scripts
"C:\Program Files\Microsoft SQL Server\100\Tools\Binn\sqlcmd.exe" -i c:\farmin\install\work\all.sql
echo restart mssql
net stop sqlserveragent && net stop mssqlserver && net start mssqlserver && net start sqlserveragent
rem отключение службы обновлений
 sc stop wuauserv
 sc config wuauserv start= disabled
 rem установка Забикса
c:\farmin\zabbix\zabbix_agentd.exe --install --config c:\farmin\zabbix\zabbix_agentd.conf
sc start "zabbix agent"
rem установка syncftp
mkdir c:\farmin\ftp\
copy /y c:\farmin\install\work\nssm.exe c:\farmin\ftp\
C:\farmin\ftp\nssm.exe install OpenHardwareMonitor C:\farmin\zabbix\script\OpenHardwareMonitor\OpenHardwareMonitor.exe
sc start OpenHardwareMonitor
rem установка Git
echo install git
C:\farmin\install\work\Git-2.20.1-64-bit.exe /SILENT /COMPONENTS="icons,ext\reg\shellhere,assoc,assoc_sh"
rem установка службы обмена
copy "i:\s.dudko\iretail\iRetailCloudClientSetup.exe" c:\farmin\install\work
c:\farmin\install\work\iRetailCloudClientSetup.exe
rem установка syncftp
cd c:\farmin\install\work\syncftp\
install_syncftp.exe
pause
