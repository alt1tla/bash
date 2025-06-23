#!/bin/bash

# Аргумент
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

# Папка
cd "$dir" || exit 1

# Файлы
for file in *
do
	[ -d "$file" ] && continue

	if [[ "$file" == *.* ]]
	then
		extension="${file##*.}"
	else
		extension="no_extension"
	fi
	
	mkdir -p "$extension"
	mv "$file" "$extension/"
done
