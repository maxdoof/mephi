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
	echo -e "Вам необходимо ввести имя группы, которую вы хотите добавить.\n"
    else
	if [[ ${#groupname} -ne 0 ]]
	then
	    #здесь нужна проверка на существование группы
	    groupadd $groupname
	    tail -5 /etc/group
	    # echo -e "Группа $groupname успешно создана.\n"
	else 
	    echo "Вы не ввели имя группы!" >&2
	fi
    fi
done
exit 0