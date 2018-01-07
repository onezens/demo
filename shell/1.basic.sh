#!/bin/bash

echo 'Hello world!'
echo "Hello world!"

#var
name='xiaoming' #name = 'xiaoming' is error syntax , not support backspace for =
echo $name

#readonly var
age=20
readonly age  #Documents/git/demo/shell/1.basic.sh: line 13: age: readonly variable
age=30
echo $age

#delete var
sex='female'
echo $sex
unset sex
echo $sex #output empty

#position var
filename=${0}
name=${1}
sage=${2}
echo $filename $name $sage #Documents/git/demo/shell/1.basic.sh xiaoming 30

#output paramater count ，not contain filename
echo ${#}

#output all paramater ,not contain filename 
echo ${*}
echo ${@}

#output current bash pid
echo ${$}

#previous process id
echo ${!}



