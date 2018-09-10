:BEGIN
@setlocal enabledelayedexpansion
@SET /P COMMAND=Command:
@for %%a in (%COMMAND%) do @(
	IF EXIST %%a (@SET _listDir=!_listDir! %%a) ELSE (@SET _listDir= & @SET REAL_COMMAND=!REAL_COMMAND! %%a)
)

@IF "%_listDir%" == " " goto LOOP_IN_DIR ELSE goto LOOP_IN_PARAM

:LOOP_IN_PARAM
@for /d %%D in (%_listDir%) do @( 
	@cd %%~fD
	IF EXIST ".git" @echo. & @echo [%%D] & @%REAL_COMMAND%
	@cd ../ 
	)
goto END
		
:LOOP_IN_DIR
@for /d %%D in (*) do @( 
	@cd %%~fD
	IF EXIST ".git" @echo. & @echo [%%D] & @%COMMAND%
	@cd ../ 
	)
	
:END
@endlocal
goto BEGIN