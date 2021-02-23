$t = New-JobTrigger -Once -At 11:15 -RepetitionDuration  (New-TimeSpan -Days 1)  -RepetitionInterval  (New-TimeSpan -Minutes 10)
$cred = Get-Credential anduser
Register-ScheduledJob -Name Task1_3 -FilePath C:\epam\Powershell\scripts\Lab5\Task.1_3.ps1 -Trigger $t -Credential $cred