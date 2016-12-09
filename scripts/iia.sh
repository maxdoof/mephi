#!/bin/bash




while [ "$groupname" != "q" ]
do
    
    #PS3='Выберите действие:'




    #выводит группы, которые уже есть
    #echo "Cуществующие группы:"
    #echo "--------------------"
    #tail -5 /etc/group
    #echo "--------------------"

    echo "Введите название группы, которую Вы хотите добавить (q - прекратить выполнение действия):"
    read groupname

    is_group=$(cat /etc/group | cut -d : -f1 | awk '($1=="'$groupname'"){print "true"}')

    if [[ $is_group == "true" ]]
    then

	echo "Группа с таким названием уже существует"
	echo "Введите снова название группы"
        read groupname
    fi

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
	    echo "Последние созданные группы"
	    tail -5 /etc/group
	    echo -e "Группа $groupname успешно создана.\n"
	else 
	    echo "Вы не ввели имя группы!" >&2
	fi
    fi
done
exit 0