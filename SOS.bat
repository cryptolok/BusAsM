
call:start

:start
	call:SOS
	goto:start
	exit /b

:sleep100
	ping 2.2.2.2 -n 1 -w 100 > nul
	exit /b


:sleep300
	ping 2.2.2.2 -n 1 -w 300 > nul
	exit /b


:sleep1000
	ping 2.2.2.2 -n 1 -w 1000 > nul
	exit /b

:dot
	start cmd /c signal.exe
	call:sleep100
	taskkill /F /IM signal.exe
	call:sleep100
	exit /b



:line
	start cmd /c signal.exe
	call:sleep300
	taskkill /F /IM signal.exe
	call:sleep100
	exit /b



:SOS
	call:sleep1000
	call:dot
	call:dot
	call:dot
	call:line
	call:line
	call:line
	call:dot
	call:dot
	call:dot
	exit /b

