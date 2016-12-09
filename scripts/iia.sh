#!/bin/bash

while [ "$groupname" != "q" ]
do
    
    #PS3='Выберите действие:'

    echo "Введите название группы, которую Вы хотите добавить (q - прекратить выполнение действия):"
    read groupname
    
    if [[ "$groupname" == "q" ]]
    then
	break
    elif [[ "$groupname" == "help" ]]
    then
	echo "Вам необходимо ввести имя группы, которую вы хотите добавить"
    else
	if [[ ${#groupname} -ne 0 ]]
	then
	    #здесь нужна проверка на существование группы
	    echo "Для добавления группы вам понадобятся root"
	    groupadd $groupname
	    tail -5 /etc/group
	    echo "Группа $groupname успешно создана"
	else 
	    echo "Вы не ввели имя группы!" >&2
	fi
    fi

done
exit 0