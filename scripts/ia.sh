#!/bin/bash
# Created by Max Doof

# Инициализация переменной диалоговых окон 
DIALOG=${DIALOG=dialog}

# Временный файл
tempfile=`tempfile 2>/dev/null`
trap "rm -f $tempfile" 0 1 2 5 15

while true
do
# Первый диалог
$DIALOG --title "Ввод данных" --clear \
	--inputbox "Создание нового пользователя. \nВведите имя." 10 51 2> $tempfile
retval=$?
case $retval in
0)
    username=`cat $tempfile`
    grep "$username:" /etc/passwd > /dev/null
	if ! [ $? -ne 0 ]; then
	# Пользователь существует
	$DIALOG --clear --title "Ошибочка" \
		--yesno "Пользователь существует.\nПовторить ввод?" 10 20 
	case $? in
	    0) continue ;;
	    1) break ;;
	esac
	# пользователь не существует
	else
	sudo useradd $username
	$DIALOG --clear --title "Успешненько" \
		--msgbox "Пользователь $username создан." 10 20 
	break 
	fi
;;
1)
    echo "нахуй иди, злой человек";;
255)
    if test -s $teempfile ; then
    cat $tempfile
    else "ESC was pressed"
    fi
;;
esac



done