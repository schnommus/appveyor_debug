@ECHO ON
C:\cygwin64\setup-x86_64.exe -q -P gdb
set PATH=C:\cygwin64\bin;%PATH%
gdb --version
@IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

