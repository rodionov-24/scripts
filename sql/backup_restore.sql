/* Restore database
USE [master]
RESTORE DATABASE [AdventureWorks2017] FROM  DISK = N'G:\AdventureWorks2017.bak' WITH  FILE = 1,  MOVE N'AdventureWorks2017' TO N'E:\newinstance\MSSQL\AdventureWorks2017.mdf',  MOVE N'AdventureWorks2017_log' TO N'F:\newinstance\MSSQL\AdventureWorks2017_log.ldf',  NOUNLOAD,  STATS = 5
GO
*/

/* 
USE [master]
GO
ALTER DATABASE [AdventureWorks2017] SET RECOVERY FULL
GO
*/

/* gull backup
BACKUP DATABASE [AdventureWorks2017] TO  DISK = N'G:\backups\AdventureWorks2017.bak'
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2017-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
*/

/* backup so shatiem
BACKUP DATABASE [AdventureWorks2017]
TO  DISK = N'G:\backup\AdventureWorks2017_compress.bak'
WITH COMPRESSION
GO
*/

/* backap log
BACKUP LOG [AdventureWorks2017]
TO DISK = N'G:\backup\adv_backuplog_3.trn'
WITH INIT;
GO
*/

/* dbcc befor backup
dbcc checkdb ('AdventureWorks2017') WITH NO_INFOMSGS, ALL_ERRORMSGS
USE master;
GO
*/

/*
EXEC sp_configure 'backup compression default', '1';
RECONFIGURE WITH OVERRIDE;
*/

/*
use AdventureWorks2017;
go
BACKUP DATABASE AdventureWorks2017 TO DISK = 'G:\backup\fullbackup.bak' WITH INIT, CHECKSUM;
GO
*/

/*
BACKUP LOG AdventureWorks2017 TO DISK = 'G:\backup\fullbackup_log.trn' WITH INIT;
GO
*/

/*
use master;
ALTER DATABASE [AdventureWorks2017] SET SINGLE_USER
RESTORE DATABASE AdventureWorks2017 FROM DISK= N'G:\backup\fullbackup.bak' WITH NORECOVERY, REPLACE
RESTORE DATABASE AdventureWorks2017 FROM  DISK = N'G:\backup\fullbackup.bak' WITH NORECOVERY
RESTORE LOG AdventureWorks2017 FROM  DISK = N'G:\backup\fullbackup_log.trn' WITH NORECOVERY
RESTORE LOG AdventureWorks2017 FROM  DISK = N'G:\backup\fullbackup_log2.trn' WITH NORECOVERY
RESTORE DATABASE AdventureWorks2017 WITH RECOVERY
*/










