#!/bin/bash
STR='HELLO'
echo $STR World!
echo This is $USER
x=5
if [ $x = 5 ]
then
	echo "x=5"
elif [ $x = 10 ]
then
	echo "x=10"
else
	echo "x!=5&x!=10"
fi
case $x in
0) echo "x=0"
;;
5) echo "x=5"
;;
10) echo "x=10"
;;
*) echo "x!=0&x!=5&x!=10"
;;
esac
declare -a array
declare -a array2
array[1]=1
array[10]=10
array2=( 1 2 3 )
echo ${array[10]}
echo "${array2[*]}"
echo "${array[@]}"
echo "${!array[@]}"
echo "${!array2[*]}"
echo "${#array[*]}"
echo "${#array2[@]}"
echo "${#array[10]}"
array+=5
array2[3]=4
echo ${array[*]}
echo ${array2[@]}
unset array[0]
echo ${array[*]}
declare -A array3
array3[el_1]=1
array3[el_2]=2
declare -A array4=([first]=1 [second]=2 [third]=3)
echo ${array3[@]}
echo ${!array3[*]}
echo ${array4[@]}
echo ${!array4[*]}
array3[el_1]=0
echo ${array3[*]}
for NUMBER in 0 1 2 3 4 5 6 7
do
	echo "The number is $NUMBER"
done
for (( i=0; i<=6; i++))
do
	echo $i
done
i=0
while [ $i -lt 5 ]
do 
	echo "$i"
	((i++))
	if [[ "$i" == '2' ]]
	then
		break
	fi
done
echo done
i=0
while [ $i -lt 5 ]
do
	((i++))
	if [[ "$i" == '2' ]]
	then
		continue
	fi
	echo "$i"
done
echo done
count=1
while [[ $# -gt 0 ]]
do
	echo "Arg $count = $1"
	count=$((count + 1))
	shift
done
