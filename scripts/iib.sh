#!/bin/bash

#PS3='Выберите действие:'
echo "Введите название группы, которую Вы хотите удалить (q - прекратить выполнение действия):"
read groupname

case $groupname in
    q) echo "Выполнение действия отменено."
       exit 0;;
    *) groupdel $groupname
       echo "Группа $groupname успешно удалена.";;
esac