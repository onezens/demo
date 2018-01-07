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




