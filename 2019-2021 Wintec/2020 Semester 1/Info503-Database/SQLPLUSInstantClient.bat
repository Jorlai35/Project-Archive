@ECHO OFF
:BEGIN
CLS
REM Select Course
echo ###################################################################
echo #                                                                 #
echo #                 SQLPlus Server Connection                       #
echo #                                                                 #
echo # 1) INFO503 Database Principles                                  #
echo # 2) INFO601 Data-modling and SQL                                 #
echo # 3) INFO706 Database Front-End Applications                      #
echo #                                                                 #
echo ###################################################################
echo.
set /p choi=Enter 1, 2 or 3: 

if /i {%choi%}=={1} goto INFO503MENU
if /i {%choi%}=={2} goto INFO601MENU
if /i {%choi%}=={3} goto INFO706MENU
echo.
echo Invalid choice
pause
goto BEGIN

:INFO503MENU
cls
echo #################################################################
echo #                                                               #
echo #         Logging on to INFO503 Database Server                 #
echo #                                                               #
echo #################################################################
echo.
goto CONT

:INFO601MENU
cls
echo #################################################################
echo #                                                               #
echo #         Logging on to INFO601 Database Server                 #
echo #                                                               #
echo #################################################################
echo.
goto CONT

:INFO706MENU
cls
echo #########################################################
echo #                                                       #
echo #         Logging on to INFO706 Database Server         #
echo #                                                       #
echo #########################################################
echo.
goto CONT


:CONT
echo.
set /p usern=Enter your Username: 
If EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:32BIT
EditV32 -m -p "Enter your password: " password
cls

:64BIT
EditV64 -m -p "Enter your password: " password
cls

REM Run the client program to log on to server
if /i {%choi%}=={1} goto STARTINFO503
if /i {%choi%}=={2} goto STARTINFO601
if /i {%choi%}=={3} goto STARTINFO706


:STARTINFO503
   START sqlplus.exe %usern%/%password%@info503-info601.cwwvo42siq12.ap-southeast-2.rds.amazonaws.com/ORCL
goto END

:STARTINFO601
   START sqlplus.exe %usern%/%password%@info503-info601.cwwvo42siq12.ap-southeast-2.rds.amazonaws.com/ORCL
goto END


:STARTINFO706
   START sqlplus.exe %usern%/%password%@info706.cwwvo42siq12.ap-southeast-2.rds.amazonaws.com./ORCL
goto END

:END