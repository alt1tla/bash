#!/bin/bash

#Аргумент
if [ "$#" -ne 2 ]
then
        echo "Путь к папке не указан и/или путь к папке для бэкапов не указан"
        exit 1
fi

CURRENT_DIR="$1"
BACKUP_DIR="$2"
DIR_NAME=$(basename "$CURRENT_DIR")
TODAY_DATE=$(date +%F_%H-%M-%S)
FILE_NAME="backup_${DIR_NAME}_${TODAY_DATE}.tar.gz"
FILE_PATH="$BACKUP_DIR/$FILE_NAME"

#Директория
if [ ! -d "$CURRENT_DIR" ]
then
        echo "$CURRENT_DIR не директория"
        exit 1
fi

#Папка бэкапов
mkdir -p "$BACKUP_DIR"

#Архив
tar -czf "$FILE_PATH" -C "$(dirname "$CURRENT_DIR")" "$(basename "$CURRENT_DIR")"
if [ $? -eq 0 ]
then
	echo "$FILE_PATH - архив создан"
else
	echo "Ошибка при создании архива"
	exit 1
fi

#Чистка
find "$BACKUP_DIR" -name "backup_*.tar.gz" -type f -mtime +7 -exec rm {} \;

