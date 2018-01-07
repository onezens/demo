#!/bin/bash

#string 
name="xiaoming"
age=20
sex="male"
info="name:${name} age: ${age} sex: ${sex}"
echo $info

#string length
echo ${#name}

#string split ${变量名:开始位置:截取长度}
comment='stay hungry, stay foolish.'
echo $comment
echo ${comment:0:11}
echo ${comment:12} #start position
echo ${comment::12}

#delete string
result=${comment#stay}
echo $result #hungry, stay foolish.

result=${comment#*a}
echo $result  #y hungry, stay foolish.

#delete string right search
result=${comment##*a}
echo $result #y foolish.

result=${comment%h*}
echo $result


result=${comment%s*ry}
echo ${result}

result1=${comment%%ry}
echo $result1

echo "\"iPhone8 arm64\""
echo '"iPhone8 arm64"'

echo "iPhoneX \niPhoneX\tiPhonex"
echo -e "iPhoneX \niPhoneX\tiPhonex"

#log line not wrap
echo -e "iPhoneX hello未来 \c "
echo "iPhoneX hello未来 "

#date
echo `date`

exit 100

exit

echo 'not exec!'






