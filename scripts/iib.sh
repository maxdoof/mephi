#!/bin/bash

while [ "$groupname" != "q" ]
do

    #PS3='Выберите действие:'
    echo "Введите название группы, которую Вы хотите удалить (q - прекратить выполнение действия):"
    read groupname
    if [[ "$groupname" == "q"]]
    then
	break
    elif [["$groupname" == help ]]
    then
	echo "Введите имя группы, которую Вы хотите удалить."
    else
	if [[ ${#groupname} -ne 0 ]]
        then
	    groupdel $groupname
            echo "Группа $groupname успешно удалена.";;
done
exit 0