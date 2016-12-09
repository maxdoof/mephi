#!/bin/bash

while [ "$groupname" != "q" ]
do

    echo "Введите название группы, из которой Вы хотите удалить пользователя (q - прекратить выполнение действия):"
    read groupname

    is_group=$(cat /etc/group | cut -d : -f1 | awk '($1=="'$groupname'"){print "true"}')

    if [[ "$groupname" == "q" ]]
    then
	break
    fi

    if [[ "$groupname" == "help" ]]
    then
	echo "Вам необходимо ввести название группы, из которой Вы хотите удалить пользователя и позже номер пользователя."
	echo
    
    elif [[ $is_group != "true" ]]
    then
	echo "Группа с таким названием не существует"
	echo

    else
	cat /etc/passwd | awk -F : '(($3>=1000)&&($1!="nfsnobody")){print $1}' | cat -n
	echo
        echo "Введите  номер пользователя, которого Вы хотите удалить из этой группы (q - прекратить выполнение действия):"
        read choice key
	user=$(cat /etc/passwd | awk -F : '(($3>=1000)&&($1!="nfsnobody")){print $1 }' | cat -n | awk '($1=="'$choice'"){print $2}')
	if [[ "$choice" == "help" ]]
        then
	    echo "Вам необходимо ввести имя группы , в которой Вы хотите удалить пользователя и позже номер пользователя"
	    break	
	fi

	if [ "$choice" == "q" ]
	then
	    break
	fi

        if [ "$user" == "" ]
	then
	    echo Ошибка! Пользователь не найден >&2
	    echo
    
	elif [[ ${#groupname} -ne 0 ]]
	then
	    gpasswd -d $user $groupname
	    tail -5 /etc/group
	else 
	    echo "Вы не ввели имя группы!" >&2
	fi
    fi
done
exit 0