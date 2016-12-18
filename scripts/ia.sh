#!/bin/bash +x
# Created by Max Doof

while true
do
# Первый диалог
echo "Создание нового пользователя. Введите имя:"
read username
if [[ "$username" = "" ]] 
then
    echo "Пустая строка."
    continue
fi

grep ":$username:" /etc/passwd 



if ! [ $? -ne 0 ]; 
then
	# Пользователь существует
	echo "Пользователь существует. Повторить ввод? (y/n)"
	read answer
	case "$answer" in
	    "y") continue ;;
	    "n") break ;;
	esac
	# пользователь не существует
	
else
	sudo useradd $username
	echo "Пользователь $username создан."  
	break 
	fi

done