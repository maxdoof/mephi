#!/bin/bash
while true
do
echo "Удаление пользователя. Введите имя или номер из списка:"
tmp="/tmp/aofijeofiwneo"
rm -f $tmp
userlist=$(grep home /etc/passwd | cut -d: -f1)
m=0

for user in $userlist
do
m=$(($m+1))
echo ":$m:$user:" >> $tmp 

done

cat $tmp | cut -d: -f2,3

read username
user=$(grep :$username: $tmp | cut -d: -f3)
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
sudo userdel $user
echo "Пользователь удален. Удалить еще одного пользователя? (y/n)"

rm -f $tmp

read answer
case "$answer" in
    "y") continue ;;
    "n") break ;;
esac


done