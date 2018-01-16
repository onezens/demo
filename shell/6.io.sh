#!/bin/bash

#input
echo "input you name: "
read name
echo "you name is : ${name}"

read -p "input you age: " age
echo "you age is : ${age}"

#timeout input
if read -t 2 -p "input you id: " id
	then
	echo "you id is: ${id}"
else
	echo "input id timeout"
fi


#security input
read -s -p "input you password: " passwd
echo "you password is : ${passwd}"

