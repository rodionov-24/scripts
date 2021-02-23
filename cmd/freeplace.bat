@echo off
SETLOCAL enableextensions 
SETLOCAL enabledelayedexpansion
set err=100
for %%j in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
	set sFreeSize=0
	set sFreeSizeOf=0
	set /a c=0
	for /f "skip=1 tokens=2 delims=:" %%i in ('fsutil volume diskfree %%j:') do (
		set /a c+=1
		rem echo !c! %%i
		if !c!==1 set sFreeSizeOf=%%i
		if !c!==2 set sFreeSize=%%i
	)
 
	if NOT !sFreeSize!==0 if NOT !sFreeSizeOf!==0 (
		set /a Free=!sFreeSize:~0,-9!
		set /a Size=!sFreeSizeOf:~0,-9!
		set /a Procent=!Free!*100/!Size!
		if !Procent! LSS 20 (
			set ah="WARNING"
			if !Procent! LSS !err! ( set err=!Procent! )
		)else ( 
			set ah=
		)
		echo !ah!Free space %%j: !Procent!%%. Free !Free! Gb of !Size! Gb 
	) 
)
endlocal
exit /b !err!