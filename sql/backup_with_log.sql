
declare @dbname varchar(20)
declare @filename varchar(50)
declare @bakpath varchar(50)

set @dbname='aptekajet'
set @bakpath='D:\backup\'

set @filename=@bakpath+@dbname+'_'+CONVERT(varchar(6),CURRENT_TIMESTAMP, 12)+'.bak'

backup database @dbname
to disk = @filename
with NAME = @dbname, skip, format, init, compression

set @filename=@bakpath+@dbname+'_'+CONVERT(varchar(6),CURRENT_TIMESTAMP, 12)+'_log.bak'
BACKUP LOG [aptekajet] 
TO  DISK = @filename
with NAME = @dbname, skip, format, init, compression
--WITH NOFORMAT, NOINIT,  NAME = N'aptekajet-Transaction Log  Backup', SKIP, NOREWIND, NOUNLOAD, compression
GO


