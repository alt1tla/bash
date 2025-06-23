#!/bin/bash

#Аргумент
if [ "$#" -ne 3 ]
then
        echo "Путь к папке не указан и/или расширение не указано и/или число слов не указано"
        exit 1
fi

CURRENT_DIR="$1"
EXTENSION="$2"
TOP_N="$3"

#Директория
if [ ! -d "$CURRENT_DIR" ]
then
        echo "$CURRENT_DIR не директория"
        exit 1
fi

#Число
if ! [[ $TOP_N =~ ^[0-9]+$ ]]
then
	echo "$TOP_N не число"
	exit 1
fi

TMPFILE=$(mktemp)

#Цикл
find "$CURRENT_DIR" -type f -name "*.$EXTENSION" -exec grep -ohE '\w+' {} + | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | grep -v '^$' > "$TMPFILE"

#Проверка
if [ ! -s "$TMPFILE" ]
then
	echo "Нет подходящих слов"
	rm "$TMPFILE"
	exit 0
fi

#Счетчик
sort "$TMPFILE" | uniq -c | sort -nr | head -n "$TOP_N" | awk '{print $2": "$1}'

#Очистка
rm "$TMPFILE"
