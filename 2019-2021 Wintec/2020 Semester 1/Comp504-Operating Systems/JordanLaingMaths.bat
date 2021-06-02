echo off &cls
echo This calculator uses a selected operator to calculate two inputed intergers.
:Restart
set /p Num1="Please input the first number: " &set /p Num2="Please input the second number: "
:ValidInput
set /p Operator="Please select type of calculation(+,-,*,/)"
if Not '%Operator%'=='+' if Not '%Operator%'=='-' if Not '%Operator%'=='*' if Not '%Operator%'=='/' goto ValidInput
set /A Answer=%Num1% %Operator% %Num2%
echo The answer is %Answer%
if '%Answer%'=='0' echo Something went wrong here
set /p Choice="Would you like to have another go(y/n): "
if /i '%Choice%'=='y' goto Restart
pause