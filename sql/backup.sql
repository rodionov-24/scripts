declare @path varchar(max)=N'D:\Backup\aptekajet_'+convert(varchar(max),getdate(),102)
BACKUP DATABASE [aptekajet] TO  DISK = @path  WITH  COPY_ONLY, NOFORMAT, NOINIT,  NAME = N'aptekajet-Полная База данных Резервное копирование', SKIP, NOREWIND, NOUNLOAD,   STATS = 10
GO