#!/bin/bash
<<<<<<< HEAD
while [ "$un" != "q" ]
do
	echo "Введите имя пользователя или часть его имени (help - помощь, q - выход):"
	read un
	if [[ "$un" == "q" ]]
	then 
		break	
	elif [[ "$un" == "help" ]]
	then
		echo "Введите имя ползователя или его часть, q - выход" 
	else
		if [[ ${#un} -ne 0 ]]
		then
			string="$(awk -vVAR="$un" -F ":" '$1 ~VAR {print "Имя ползователя: "$1":\n Хеш пароля: "$2 "; UID: "$3 "; GID: "$4 ";\n Домашний каталог: "$6"; Shell: "$7"\n\n"} ' /etc/passwd)"
		if [[ ${#string} -ne 0 ]]
		then
			IFS=""
			echo $string | less 
		else
			echo "Совпадений не найдено"
		fi
		
		else
			echo "Вы не ввели имя пользователя!" >&2
		fi
	fi
done
exit 0
=======
echo "Введите имя пользователя или часть его имени:"
read username
un=$username
awk -vVAR="$un" -F ":" '$1 ~VAR {print "Имя пользователя: "$1"; Хеш пароля: "$2 ";\n UID: "$3 "; GID: "$4 "; GECOS: "$5";\n Домашний каталог: "$6"; Shell: "$7"\n"} ' /etc/passwd
>>>>>>> c0be75b74cd24cb6f56462de559e4a47f2575684
