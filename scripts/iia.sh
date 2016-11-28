#!/bin/bash

PS3='Выберите действие:'

echo "Введите название группы, которую Вы хотите добавить (q - прекратить выполнение действия):"
read groupname

case $groupname in
    q) echo "Выполнение действия отменено."
       exit 0;;
    *) groupadd $groupname
       echo "Группа $groupname успешно создана.";;
esac