﻿Get-ChildItem -Path 'C:\Program Files\*.exe' -Recurse | Select-Object -Property Name, CreationTime, Length  |Sort-Object -Property Name –Descending 