#!/bin/bash

#Аргумент
if [ -z "$1" ] 
then
	echo "Путь к папке не указан"
	exit 1
fi

#Абсолютный путь
dir=$(realpath "$1")

#Директория
if [ ! -d "$dir" ]
then
	echo "$dir не директория"
	exit 1
fi

#Рекурсия
get_size() {
	path="$1"
	local sum_size=0

	#Перебор
	while read -r size
	do
		sum_size=$((sum_size + size))
	done < <(find "$path" -type f -printf "%s\n")
	echo "$sum_size"
}

#Удобочитаемость
readable() {
	bytes=$1
	if ((bytes >= 1073741824))
	then
		echo "$((bytes / 1073741824))G"
	elif ((bytes >= 1048576))
	then
		echo "$((bytes / 1048576))M"
	elif ((bytes >=1024)) 
	then
		echo "$((bytes / 1024))K"
	else
		echo "${bytes}B"
	fi

}

#Размер
sum_size=$(get_size "$dir")
readable=$(readable "$sum_size")
echo "$dir: $readable"
