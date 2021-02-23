Get-ChildItem -Recurse C:\epam | Where-Object {$_.Name -notlike '*ps1'} | Measure-Object -Property Length -sum 
# Для выполнения задания был выбрен другой пусть, исключены файлы с расширение ps1