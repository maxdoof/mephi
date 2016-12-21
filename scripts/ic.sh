#!/bin/bash
while true
do
echo "Блокировка или разблокировка пользователя. Введите имя или номер из списка:"
tmp="/tmp/jnjnjnjnjqiwubqiwu"
rm -f tmp
userlist=$(grep home /etc/passwd | cut -d: -f1)
m=0

for user in $userlist
do
m=$(($m+1))
is_locked=$(sudo passwd -S -a | grep "$user" | cut -d" " -f2)
echo ":$m:$user:$is_locked" >>$tmp

done

cat $tmp | cut -d: -f2,3,4 | sed 's/:L/ - Locked/g' | tr 'P' ' ' | tr ':' ' '  

read username
user=$(grep :$username: $tmp | cut -d: -f3)
user_status=$(grep :$username: $tmp | cut -d: -f4)
if [[ $user = "" ]]; 
then
    echo "Пользователь не существует или введена пустая строка"
    echo "Повторить? (y/n)"
    read answer
    case "$answer" in
	"y") continue ;;
	"n") break ;;
    esac
fi
case "$user_status" in
    "P")
	echo "Пользователь $user не заблокирован. Заблокировать (y/n)?"
	read answer
	case "$answer" in
	    "y") sudo usermod -L $user  
		 echo "Пользователь заблокирован" ;;
	    "n") echo "Операция отменена" ;;
	esac ;;
    "L")
	echo "Пользователь $user заблокирован. Разблокировать (y/n)?"
	read answer
	case "$answer" in
	    "y") sudo usermod -U $user 
		 echo "Пользователь разблокирован" ;;
	    "n") echo "Операция отменена" ;;
	esac ;;
esac

echo "Еще одного пользователя? (y/n)"

rm -f $tmp

read answer
case "$answer" in
    "y") continue ;;
    "n") break ;;
esac


done