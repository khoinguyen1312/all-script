:BEGIN
@SET /P COMMAND=Command:
@for /d %%D in (*) do @( 
	@cd %%~fD
	IF EXIST ".git" @echo. & @echo [%%D] & @%COMMAND%
	@cd ../ 
	)
goto BEGIN