chcp 65001
@echo off
rem Копируем ярлыки на рабочий стол
xcopy c:\farmin\iRetailManagement\iRetailManagement.lnk %userprofile%\desktop
xcopy C:\farmin\iRetailPOS\iRetailPOS.lnk %userprofile%\desktop
xcopy c:\farmin\install\work\farmin.rdp %userprofile%\desktop
rem Установка чата и почты
c:\farmin\install\work\Miranda_1.3.msi /quiet
c:\farmin\install\work\thunderbird_1.7_apteki.msi /quiet
c:\farmin\install\work\googlechromestandaloneenterprise.msi
rem установка картинки на рабоий стол
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /d "C:\farmin\install\work\pict.png" /f
rem Импорт параметров реестра
reg import c:\farmin\install\work\reg.reg
reg import c:\farmin\install\work\google.reg
rem отключаем сетевой диск
net use i: /delete
rem удаление пользователя Заведующая из группы Администраторы
net localgroup Администраторы Заведующая /delete
echo all done
pause


