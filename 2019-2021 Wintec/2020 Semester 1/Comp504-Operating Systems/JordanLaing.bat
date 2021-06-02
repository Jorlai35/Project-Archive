echo off &cls
set /p yourname=Please enter your name: 
:GenderLoop
echo Hello %yourname%
set /p gender="Are you Male(M), Female(F) or Other(O): " 
if /i '%gender%'=='m' echo Hello, Sir! &goto Finish
if /i '%gender%'=='f' echo Hello, Ma'am! &goto Finish
if /i '%gender%'=='o' echo Hello, Other! &goto Finish
cls &Goto GenderLoop
:Finish
echo Nice to meet you
pause