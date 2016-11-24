#!/bin/bash
echo "Введите имя пользователя или пользователя или часть его имени:"
read username
un=$username
awk -vVAR="$un" -F ":" '$1 ~VAR {print "Имя ползователя: "$1"; Хеш пароля: "$2 ";\n UID: "$3 "; GID: "$4 "; GECOS: "$5";\n Домашний каталог: "$6"; Shell: "$7"\n"} ' /etc/passwd
