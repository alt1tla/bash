#!/bin/bash

show_menu() {
	clear
	echo "Меню лабораторная №2:"
	echo "========================================"
	echo "1. Шахматы"
	echo "2. Выйти"
	echo "========================================"
}

draw_chess(){
	read -p "Введите размер доски:" size
	if ! [[ "$size" =~ ^[0-9]+$ ]] || ((size <= 0))
	then
		echo "Ошибка: значение не валидно"
		read -p "Для продолжения нажмите Enter..."
		return
	fi
	WHITE="\e[47m"
	RED="\e[41m"
	ZERO="\e[0m"
	echo "Шахматная доска $sizeх$size"
	echo "========================================"
	for ((i=0; i<size; i++))
	do 
		for ((j=0; j<size; j++))
		do
			if (( (i+j) % 2 == 0 ))
			then
				echo -ne "${WHITE}   ${ZERO}"
			else
				echo -ne "${RED}   ${ZERO}"
			fi
		done
		echo 
	done
}

while true
do
	show_menu
	read -p "Выберите пункт меню:" choice
	echo "========================================"
	case $choice in
		1) draw_chess;;
		2) echo "Завершение.."; exit 0;; 
		*) echo "Пожалуйста, вберите пункт от 1 до 2";;
	esac
	echo "========================================"
	read -p "Для продолжения нажмите Enter..."
done
