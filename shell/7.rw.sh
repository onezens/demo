#!/bin/bash


#read file and read it for line
cat 6.io.sh | while read str
do
	echo $str
done


#no wrap
printf "this is printf"
printf "\n" 
#auto wrap
echo "this is echo"

#printf format
# 10s 10个字符 - 左对齐
printf "%-10s %-8s %-4s \n" 姓名 性别 体重kg
printf "%-10s %-8s %-4s \n" abc 男 64kg
printf "%-10s %-8s %-4s \n" jar 男 65kg

printf "%d %s \n" 1 "Hello"
printf '%d %s \n' 1 "Hi, are you ok?"
printf %s fine and you?
printf " \"<%s>\" " "yeap!"
printf "\n"


function testFunc(){
	echo "Hello world"
    echo "第一个参数: $0"
    echo "第二个参数: $1"
    echo "第三个参数: $2"
    echo "第四个参数: $3"
}

echo "调用前"
testFunc $1 $2 "100"
echo "调用后"


echo "this is echo redirect file test1" > 0.tmp.txt