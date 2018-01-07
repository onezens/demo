#!/bin/bash

#init array
iphone=("iPhone4s" "iPhone5s" "iPhone6s" "iPhone7")
echo $iphone

newIphone=()
newIphone[0]="iPhone8"
newIphone[1]="iPhone8plus"
newIphone[2]="iPhoneX"
echo $newIphone
echo ${newIphone[0]} ${newIphone[1]} ${newIphone[2]}

#log all element
echo ${newIphone[*]}
echo ${newIphone[@]}

#array length
echo ${#newIphone[*]}
echo ${#newIphone[@]}

#array element length
echo ${#newIphone[0]}