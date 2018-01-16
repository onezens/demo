#!/bin/bash

for name in "xiaming" "Janny" "Job" "James"; do
	echo $name
done

val="I don\`t konw"
for name in ${val}
do
   echo ${name}
done

path="/Users/leaf/Documents/git/demo/shell/*"
for elem in ${path}
do
	echo $elem
done


for ((a=1; a<5; a++))
do
	for ((b=1; b<5; b++))
	do
		echo "a=${a} b=${b}"
	done
done

a=0
while (($a<10))
do
	echo $a
	a=`expr $a + 1`
done



b=3
case $b in
1)
	echo "b=${b}"
;;
2)
	echo "b=${b}"
;;
3)
	echo "b=${b}"
;;
esac


i=0
# util 是反的逻辑
until [[ $i>3 ]]; do 
	echo $i
	i=`expr $i + 1`
done


for ((i=0; i<4; i++))
do
	echo "i=${i}"
	if [ ${i} -eq 2 ]
	then
		echo "break"
		break
	fi
done


for ((i=0; i<5; i++))
do
	echo "i=${i}"
	for ((j=0; j<5; j++))
	do
		echo -e "j=${j} \c"
		if [ ${j} -eq 3 ]
			then
			echo "break"
			break
		fi
	done
done

for ((i=0; i<5; i++))
do
	echo -e "i=${i} \c"
	for ((j=0; j<5; j++))
	do
		if [ $j -eq 3 ]
			then
			echo "continue"
			continue
		fi
		echo "j=${j}"
	done
done

