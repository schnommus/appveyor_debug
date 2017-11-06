@ECHO OFF

set PATH=C:\splint-3.1.2\bin;%PATH%
IF NOT DEFINED PYTHON set PYTHON=py -3
IF NOT DEFINED COREDIR set COREDIR=.

ECHO ON

FOR %%P in ("C:\cygwin64\usr\bin;C:\cygwin64\bin" "C:\msys64\usr\bin;C:\msys64\bin") DO (CALL :runtestswithpath %%P)
GOTO :eof


:runtestswithpath
@IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

SET OLDPATH=%PATH%
SET PATH=%~1;%PATH%
CALL :runtests
SET TESTRESULT=%ERRORLEVEL%
SET PATH=%OLDPATH%

EXIT /B %TESTRESULT%


:runtests
@IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

%PYTHON% --version
@IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
git --version
@IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
gcc --version
@IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
gdb --version
@IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
splint --help
@IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
GOTO :eof
