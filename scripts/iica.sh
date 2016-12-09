#!/bin/bash

while [ "$groupname" != "q" ]
do
    #PS3='Выберите действие:'
    echo "Введите группу, в которую Вы хотите добавить пользователя (q - прекратить выполнение действия):"
    read groupname

    is_group=$(cat /etc/group | cut -d : -f1 | awk '($1=="'$groupname'"){print "true"}')

    if [[ "$groupname" == "q" ]]
    then
	break
    fi

    if [[ "$groupname" == "help" ]]
    then
	echo "Вам необходимо ввести имя группы, в которую Вы хотите добавить пользователя."

    
    elif [[ $is_group != "true" ]]
    then
	echo "Группа с таким названием не существует"

    else
        echo "Введите  имя пользователя, которого Вы хотите добавить в эту группу (q - прекратить выполнение действия):"
        read username
        if [[ "$username" == "q" ]]
        then
	    break
	fi
        if [[ "$username" == "help" ]]
        then
	    echo "Вам необходимо ввести имя пользователя, которого Вы хотите добавить."
        
    
	elif [[ ${#groupname} -ne 0 ]]
	then
	    usermod -a -G $groupname $username
	    tail -5 /etc/group
	else 
	    echo "Вы не ввели название группы или имя пользователя!" >&2
	fi
    fi
done

exit 0