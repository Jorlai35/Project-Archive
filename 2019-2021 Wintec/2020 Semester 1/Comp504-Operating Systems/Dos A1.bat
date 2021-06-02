echo off &cls
set /p yourname="Please enter your name: "
:GenderLoop
echo "Hello %yourname%"
set /p gender="Are you Male(M), Female(F) or Other(O): " 
if '%gender%'=='M' echo "Hello, Sir!" else if '%gender%'=='m' echo "Hello, Sir!"
if '%gender%'=='F' echo "Hello, Ma'am!" else if '%gender%'=='f' echo "Hello, Ma'am!"
if '%gender%'=='O' echo "Hello, Other!" else if '%gender%'=='o' echo "Hello, Other!"
if not















echo off
cls
set yourname=
set /p yourname="Please enter your name: "
:GenderLoop
echo "Hello %yourname%"
set gender=
set /p gender="Are you Male(M), Female(F) or Other(O): "
if not '%gender%'=='' set gender=%gender:~0,1%

if '%gender%'=='M'  Goto Male
if '%gender%'=='m'  Goto Male
if '%gender%' == 'F' or '%gender%' == 'f' (Goto Female)
if '%gender%' == 'O' or '%gender%' == 'o' (Goto Other)
cls
Goto GenderLoop

:Male
echo "Hello, Sir!"
Goto Finish
:Female
echo "Hello, Ma'am!"
Goto Finish
:Other
echo "Hello, Other!"
Goto Finish

:Finish
echo "Nice to meet you"
pause