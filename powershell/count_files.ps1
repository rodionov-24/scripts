$dat= ((Get-Date).AddMinutes((-5)))
Get-ChildItem "C:\soft" -Recurse | Where-Object {($_.LastWriteTime -lt $dat)}