@echo off
setlocal enabledelayedexpansion
echo !RANDOM! >NUL
set number=%~1
set result=
REM set numrealset=10
REM set realset=1234567890

REM set realset=abcdefghijklmnopqrstuvwxyz
REM set numrealset=26

set realset=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
set numrealset=52

set /a countset=numrealset-1
:initialize
for /l %%a in (0,1,%countset%) do set setchr[%%a]=!realset:~%%a,1!

goto randomgen
:randomgen
set dopadding=1
set dontpad=1
set dontrepeat=-1
set /a padset=number-26
:repeat
set rand_lenth=
set lenth=0
for /l %%i in (%countset%,-1,1) do (
call :setrand
set /a rand_gen=1+%%i*!randum!/32767
set rand_lenth=!rand_lenth! !rand_gen!
set /a lenth+=1
if !lenth! GTR  %number% goto next
if !lenth! GTR  26 goto next
)
:next
for /f "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26 delims= " %%a in ("!rand_lenth!") do set result=!result!"!setchr[%%a]!!setchr[%%b]!!setchr[%%c]!!setchr[%%d]!!setchr[%%e]!!setchr[%%f]!!setchr[%%g]!!setchr[%%h]!!setchr[%%i]!!setchr[%%j]!!setchr[%%k]!!setchr[%%l]!!setchr[%%m]!!setchr[%%n]!!setchr[%%o]!!setchr[%%p]!!setchr[%%q]!!setchr[%%r]!!setchr[%%s]!!setchr[%%t]!!setchr[%%u]!!setchr[%%v]!!setchr[%%w]!!setchr[%%x]!!setchr[%%y]!!setchr[%%z]!"
set /a padset=padset-26
if %padset% LSS 0 set /a dontrepeat+=1
:checkrepeat
if %dontrepeat% LSS 1 goto repeat
set "result=%result:"=%"
set result="!result:~1,%number%!"
for /f "tokens=*" %%i in (!result!) do (echo %%~i)& REM powershell -c "\"%%~i\".length"
goto :eof

:setrand
set randum=%random%
exit /b

::: PRAISE THE LORD, THE KING ^( ^^ )^
