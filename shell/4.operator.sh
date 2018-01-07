#!/bin/bash

#1.arithmetic operator

a=1000
b=2000
c=`expr $a + $b` #must have white space
echo $c

a=2000
b=1000
c=`expr $a - $b`
echo $c

a=9
b=9
c=`expr $a \* $b`
echo $c

a=81
b=9
c=`expr $a / $b`
echo $c

a=1231
b=101
c=`expr $a % $b`
echo $c


if [ $a -eq $b ]
	then
	echo 'a = b'
else
	echo 'a!=b'
fi


if [ $a -ne $b ]
	then
	echo 'a != b'
else
	echo 'a=b'
fi


if [ $a -gt $b ]
	then
	echo 'a > b'
else
	echo 'a < b'
fi

if [ $a -lt $b ]
	then
	echo 'a < b'
else
	echo 'a > b'
fi

# -le - ge

if [ $a != $b ]
	then
	echo 'a != b'
else
	echo 'a=b'
fi


#logic operator

if [ $a -gt 100 -o $b -gt 100 ]
	then
	echo 'a or b > 100'
else
	echo 'a and b <=100'
fi

if [ $a -gt 100 ] || [ $a -gt 100 ]
	then
	echo 'a or b > 100'
else
	echo 'a and b <=100'
fi	


if [ $a -gt 100 -a $b -gt 100 ]
	then
	echo 'a and b > 100'
else
	echo 'a and b <= 100'
fi


if [ $a -gt 100 ] && [ $b -gt 100 ]
	then
	echo 'a and b > 100'
else
	echo 'a and b <= 100'
fi


#string operator
x="xiaoming"
y="zhanghua"
if [ $x == $y ]
	then
	echo "x=y=${x}"
else
	echo "x=${x}  y=${y}"
fi

y="xiaoming"
if [ $x != $y ]
	then
	echo "x=${x}  y=${y}"
else
	echo "x=y=${x}"
fi

z=""

if [ -z $z ]
	then
	echo 'z is empty string'
else
	echo "z is ${z}"
fi

if [ -n $z ]
	then
	echo 'z is empty string'
else
	echo "z is ${z}"

fi

if [ $z ]
	then
	echo 'z is empty string'
else
	echo "z is ${z}"
fi

z=null
if [ $z ]
	then
	echo 'z is null'
else
	echo "z is ${z}"
fi


#file operator
filepath="/Users/leaf/Documents/git/demo/shell/"
if [ -d $filepath ]
	then
	echo "${filepath} is directory"
else
	echo "${filepath} is not directory"
fi

filepath="/Users/leaf/Documents/git/demo/shell/4.operator.sh"
if [ -r $filepath ]
	then
	echo "${filepath} is readable"
else
	echo "${filepath} is readonly"
fi

if [ -w $filepath ]
	then
	echo "${filepath} is writeable"
else
	echo "${filepath} is not writeable"
fi

if [ -x $filepath ]
	then
	echo "${filepath} is can execuate"
else
	echo "${filepath} is not execuate"
fi


if [ -f $filepath ]
	then
	echo "${filepath} is filepath"
else
	echo "${filepath} is not filepath"
fi


if [ -e $filepath ]
	then
	echo "${filepath} is exist"
else
	echo "${filepath} is not exist"
fi


if [ -s $filepath ]
	then
	echo "${filepath} is not empty"
else
	echo "${filepath} is empty"
fi

if [ -s $filepath ]; then
	echo "${filepath} is not empty"
else
	echo "${filepath} is empty"
fi
