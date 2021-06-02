echo off
color 06
cls
echo This program will generate a random number. The aim of the game is to guess the random number. You will be given hints of Higher! or Lower! in relation to the random number. If you wish to give up just type "giveup".
:Restart
set /A Answer=%RANDOM%
echo (Answer is %Answer%)
set Trys=1

:GuessLoop
set /p Guess="Your guess number %Trys% is? "
if /i '%Guess%'=='giveup' goto Lose
if %Guess% GTR 32767 echo Please enter a number less than 32767 &goto GuessLoop
set /A Trys=%Trys%+1
if '%Guess%'=='%Answer%' goto Victory
if %Guess% LSS %Answer% echo Higher! &goto GuessLoop
if %Guess% GTR %Answer% echo Lower! &goto GuessLoop

:Victory
echo Congratulations on winning
echo you had %Trys% guesses
set /p Choice="would you like to try again (Y,N): "
if /i "%Choice%" == "Y" goto Restart
pause
exit

:Lose
echo The answer was: %Answer%
set /p Choice="would you like to try again (Y,N): "
if /i "%choice%" == "Y"goto Restart
pause
exit