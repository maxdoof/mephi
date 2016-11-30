#!/bin/bash
while [ "$gn" != "q" ]
do
	echo "Введите название группы или ее часть (help - помощь, q - выход):"
	read gn
	if [[ "$gn" == "q" ]]
	then 
		break	
	elif [[ "$gn" == "help" ]]
	then
		echo "Справка: введите название группы или его часть, q - выход. Разработал klauz42" 
	else
		if [[ ${#gn} -ne 0 ]]
		then
			string="$(awk -vVAR="$gn" -F ":" '$1 ~VAR {print "Группа: "$1":\n GID: "$3"; Список участников: "$4"\n "} ' /etc/group)"
		if [[ ${#string} -ne 0 ]]
		then
			IFS=""
			echo $string | less 
		else
			echo "Совпадений не найдено"
		fi
		
		else
			echo "Вы ничего не ввели!" >&2
		fi
	fi
done
exit 0
