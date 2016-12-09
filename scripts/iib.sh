
#!/bin/bash




while [ "$groupname" != "q" ]
do
    echo "Введите название группы, которую Вы хотите удалить (q - прекратить выполнение действия):"
    read groupname

    is_group=false
    is_group=$(cat /etc/group | cut -d : -f1 | awk '($1=="'$groupname'"){print "true"}')

    if [[ "$groupname" == "q" ]]
    then
	break

    
    

    
    elif [[ "$groupname" == "help" ]]
    then
	echo -e "Введите имя группы, которую Вы хотите удалить.\n"
    else 
	if [[ $is_group != "true" ]]
        then
	    echo "Группа с таким названием не существует"

	elif [[ ${#groupname} -ne 0 ]]
	then
	    echo "группы"
	    tail -5 /etc/group
	    groupdel $groupname
            echo "Группа $groupname успешно удалена."
	    echo "группы"
	    tail -5 /etc/group
	    echo -e "Группа $groupname успешно удалена.\n"
	else 
	    echo "Вы не ввели имя группы!" >&2
	fi
    fi
done
exit 0