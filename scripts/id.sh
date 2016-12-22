#!/bin/bash
#добавление пользователя в группу
temp_users=$(mktemp)
temp_groups=$(mktemp)

h=1
while((h));
do
    grep "/home" /etc/passwd | cut -d: -f1 > $temp_users
    i=1
    while read line; do
	users[i]="$line"
    	echo "$i ${users[i]}"
	i=$(($i+1))
    done < $temp_users

	while((h));
	do
		echo "Введите имя пользователя или порядковый номер"
		read answer
		if [[ "$answer" =~ ^[0-9]+$ ]]&&(( "$answer" >= 1 && "$answer" <= ${#users[@]}))
		then
			found_user="${users[answer]}"
		elif [[ "$answer" =~ ^[0-9]+$ ]]
		then			
			echo "Неправильный порядковый номер" >&2
			continue
		elif [[ "$answer" == "q" ]]
		then 
			quit=1
			break
		else
			found_user="$answer"
		fi	
		user=`grep -w $found_user $temp_users`
		if [ -z "$user" ]
		then
			echo "такого пользователя нет" >&2
			continue
		fi
		break
	done
	if [[ "$quit" == "1" ]]
	then
		break
	fi	
	cut -d: -f1 /etc/group > $temp_groups
	i=1
	while read line; do
		groups[i]="$line"
		echo "$i ${groups[i]}"
		i=$(($i+1))
	done < $temp_groups
	while((h));
		do
			echo "Введите название группы или порядковый номер"
			read answer
			if [[ "$answer" =~ ^[0-9]+$ ]]&&(( "$answer" >= 1 && "$answer" <= ${#groups[@]}))
			then
				found_group="${groups[answer]}"
			elif [[ "$answer" =~ ^[0-9]+$ ]]
			then			
				echo "Неправильный порядковый номер" >&2
				continue
			elif [[ "$answer" == "q" ]]
			then 
				quit=1
				break
			else
				found_group="$answer"
			fi	
			group=`grep -w $found_group $temp_groups`
			if [ -z "$group" ]
			then
				echo "такой группы нет" >&2
				continue
			fi
			break
	done
	if [[ "$quit" == "1" ]]
	then
		break
	fi
	sudo usermod -aG $group $user
	echo "Пользователь добавлен. Повторить?(y/n)"
	read answer
	if [[ "$answer" == "n" ]]
	then
		break
	fi
done


rm -f $temp_users
rm -f $temp_groups