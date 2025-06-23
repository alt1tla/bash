#!/bin/bash
#Display menu
show_menu() {
	clear
	echo "Меню лабораторная №1:"
	echo "========================================"
	echo "3. Домашний каталог"
	echo "4. Название и версия операционной системы"
	echo "5. Показать все доступные оболочки в вашей системе"
	echo "6. Текущие пользователи, вошедшие в систему"
	echo "7. Количество пользователей, вошедших в систему"
	echo "8. Информация о жестких дисках"
	echo "9. Информация о процессоре"
	echo "10. Информация о памяти"
	echo "11. Информация о файловой системе"
	echo "12. Информация об установленных пакетах ПО"
	echo "13. Вывести всю информацию в файл"
	echo "14. Завершить работу скрипта"
	echo "========================================"
}
#Main functions
working_directory_info (){
	echo "Текущий рабочий каталог: $(pwd)"
}
running_process_info () {
	echo -e "Текущий запущенный процесс:\n$(ps -p $$)"
}
home_directory_info () {
	echo "Домашний каталог: $HOME"
}
name_version_os_info () {
	echo "Название и версия ОС: $(uname -a)"
}
available_shells_info () {
	echo -e "Доступные оболочки в системе:\n$(cat /etc/shells)"
}
current_users_info () {
	echo -e "Текущие пользователи, вошедшие в систему:\n$(who)"
}
current_users_count_info () {
	echo "Количество пользователей, вошедших в систему: $(who | wc -l)"
}
hard_drives_info () {
	echo -e "Информация о жестких дисках:\n$(lsblk)"
}
cpu_info () {
	echo -e "Информация о процессоре:\n$(lscpu)"
}
memory_info () {
	echo -e "Информация о памяти:\n$(free -h)"
}
filesystem_info () {
       	echo -e "Информация о файловой системе:\n$(df -Th)"
}
installed_packages_info () { 
	echo "Информация об установленных пакетах ПО: $(dpkg -l | grep ^ii)"
}
#Output into file
write_to_file () {
	local filename=$1
	{
		working_directory_info
		echo "========================================"
                running_process_info
		echo "========================================"
                home_directory_info
		echo "========================================"
                name_version_os_info
		echo "========================================"
                available_shells_info
		echo "========================================"
                current_users_info
		echo "========================================"
                current_users_count_info
		echo "========================================"
		hard_drives_info
		echo "========================================"
		cpu_info
		echo "========================================"
                memory_info
		echo "========================================"
		filesystem_info
		echo "========================================"
                installed_packages_info
	} >> "$filename"
	echo "Информация сохранена в файл $filename"
}
#Get the options
while getopts ":of:-:" option
do
        case $option in
                o) read -p "Введите имя файла для со хранения: " filename
			if [ -z "$filename" ] 
			then
				echo "Ошибка: не указано имя файла"
		 		exit 1
		     	fi
			write_to_file "$filename"; exit 0;;
		f)      if [ -z "$OPTARG" ]
		       	then
				echo "Ошибка: не указано имя файла"
				exit 1
			fi
			write_to_file "$OPTARG"; exit 0;;
		-) 
			case $OPTARG in
				tofile) 
					if [[ -z ${!OPTIND} ]]
					then
						echo "Ошибка: не указано имя файла"
						exit 1
					fi
					write_to_file "${!OPTIND}"; exit 0;;
				*) echo "Такого флага не существует"; exit 1;;
			esac
			exit ;;
	
                *) echo "Такого флага не существует"; exit 1;;
        esac
done
#Main script
while true
do
		show_menu
        	read -p "Выберите пункт меню: " choice
        	echo "========================================"
        	case $choice in
	       		1) working_directory_info;;
                	2) running_process_info;;
                	3) home_directory_info;;
                	4) name_version_os_info;;
                	5) available_shells_info;;
                	6) current_users_info;;
                	7) current_users_count_info;;
                	8) hard_drives_info;;
                	9) cpu_info;;
                	10) memory_info;;
                	11) filesystem_info;;
                	12) installed_packages_info;;
                	13) read -p "Введите имя файла для сохранения: " filename; write_to_file "$filename";;
                	14) echo "Завершение..."; exit 0;;
                	*) echo "Пожалуйста, выберите пункт от 1 до 14";;
		esac
		echo "========================================"
		read -p "Для подолжения нажмите Enter..."
done
