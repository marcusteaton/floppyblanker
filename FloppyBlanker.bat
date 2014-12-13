@echo off
title FloppyBlanker - http://marcus.crisisresponseunit.com/

REM If choice was invalid, send user back to here
goto start
:start

REM Set "choice" variable to blank to clear any previous value
set choice=

REM Prompt user for what they wish to select
set /p choice=Which drive is your floppy drive? (do not type the colon):
if not '%choice%'=='' set choice=%choice:~0,1%

REM Set valid choices
if '%choice%'=='A' goto Scan
if '%choice%'=='a' goto Scan
if '%choice%'=='B' goto Scan
if '%choice%'=='b' goto Scan

REM Show user this message if their choice was invalid and wait for user input
echo.
echo "%choice%" is not a valid choice. This may be for one of two reasons:
echo "%choice%" isn't a drive letter for a 3.5" Hi-Density floppy disk drive.
echo (Valid letters for floppy drives are A: and B:.)
echo "%choice%" isn't a valid drvie letter at all. This includes numbers or symbols such as #, *, or !.
echo.
pause

REM Send them back to prompt
cls
goto start

REM If the choice was valid, then begin the process
:Scan
cls
format %choice%: /fs:FAT /x /f:1.44
pause
exit