##!/bin/bash

while [ "$groupname" != "q" ]
do
    #PS3='Выберите действие:'
    echo "Введите название группы, из которой Вы хотите удалить пользователя (q - прекратить выполнение действия):"
    read groupname

    is_group=$(cat /etc/group | cut -d : -f1 | awk '($1=="'$groupname'"){print "true"}')
    if [[ $is_group != "true" ]]
    then

	echo "Группа с таким названием не существует"
	echo "Введите снова название группы"
        read groupname
    fi

    if [[ "$groupname" == "q" ]]
    then
	break
    fi
    if [[ "$groupname" == "help" ]]
    then
	echo "Вам необходимо ввести название группы, из которой Вы хотите удалить пользователя."
    fi
    echo "Введите  имя пользователя, которого Вы хотите удалить из $groupname (q - прекратить выполнение действия):"
    read username
    if [[ "$groupname" == "q" ]]
    then
	break
    elif [[ "$groupname" == "help" ]]
    then
	echo "Вам необходимо ввести имя пользователя,которого вы хотите удалить"
    else
	if [[ ${#groupname} -ne 0 ]]
	then
	    gpasswd -d $username $groupname
	    tail -5 /etc/group
	else 
	    echo "Вы не ввели название группы или имя пользователя!" >&2
	fi
    fi



done

exit 0