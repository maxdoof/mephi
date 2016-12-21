#menu
#!/bin/bash

#Created by Roza

#включить отладку
DEBUG=1

inital()
{
    clear
    echo -e "Управление пользователями и группами\nС помощью данной программы Вы можете управлять пользователями и группами пользователей.\nВо время работы с программой, на Вашем экране будут появляться подсказки, которые помогут Вам быстрее сориентироваться по действиям."
    echo -e "\nРазработчики:\nАбдуллаева Роза\nАлешин Максим\nЕлькин Дмитрий\nМатвеев Николай\nШишков Глеб\n"
}

#управление пользователями
control_user()
{
    clear
    #echo -e "\n"
    PS3='Выберите действие (help - помощь, q - выход в главное меню): '

    #перечень пунктов меню управления пользователем
    OPTIONS=(
    	"Добавить пользователя"
    	"Удалить пользователя"
    	"Заблокировать пользователя"
	"Добавить пользователя в группу"
	"Сменить пароль пользователя"
    )
    
    select opt in "${OPTIONS[@]}"; do
	#echo "Вы выбрали: $opt"
	case $REPLY in
	    1) chmod +x ./scripts/ia.sh
		./scripts/ia.sh;;
	    2) chmod +x ./scripts/ib.sh
		./scripts/ib.sh;;
	    3) chmod +x ./scripts.ic.sh
		./scripts/ic.sh;;
 	    4) chmod +x ./scripts/id.sh
		./scripts/ia.sh;;
	    5) chmod +x ./scripts/ie.sh
		./scripts/ib.sh;;
	    help) echo "Вам необходимо выбрать одно из предложенных действий для дальнейшей работы с пользователем.";;
	    q)clear
	    menu;;
	    *) echo "Неверно выбрано действие!" >&2;;
	esac
    done
}

#управление группами
control_group()
{
    clear
    #echo -e "\n"
    PS3='Выберите действие (help - помощь, q - выход в главное меню): '

    OPTIONS=(
        "Добавить группу"
        "Удалить группу"
        "Добавить пользователя в группу"
        "Удалить пользователя из группы"
    ) 
     
    select opt in "${OPTIONS[@]}"; do
	#echo "Вы выбрали: $opt"
	case $REPLY in
	    1) chmod +x ./scripts/iia.sh
		./scripts/iia.sh;;
	    2) chmod +x ./scripts/iib.sh
		./scripts/iib.sh;;
	    3) chmod +x ./scripts/iica.sh
		./scripts/iica.sh;;
	    4) chmod +x ./scripts/iicb.sh
		./scripts/iicb.sh;;
	    help) echo "Вам необходимо выбрать одно из предложенных действий для дальнейшей работы с группой.";;
	    q) clear
	    menu;;
	    *) echo "Неверно выбрано действие!" >&2;;
	esac
	#echo -e "1) Добавить группу\n2) Удалить группу\n3) Добавить пользователя в группу\n 4) Удалить пользователя из группы"
    done    
}

#поиск пользователей или групп
search()
{
    clear
    #echo -e "\n"
    PS3='Выберите действие (help - помощь, q - выход в главное меню): '

    OPTIONS=(
        "Найти пользователя"
        "Найти группу"
    )

    select opt in "${OPTIONS[@]}"; do
        #echo "Вы выбрали: $opt"
	case $REPLY in
	    1)
		chmod +x ./scripts/iiia.sh
		./scripts/iiia.sh
		;;
	    2)
		chmod +x ./scripts/iiib.sh
		./scripts/iiib.sh
		;;
	    help) 
		echo "Вам необходимо выбрать поиск пользователя или группы.";;
	    q) 
		clear
		menu;;
	    *) echo "Неверно выбрано действие!" >&2;;
	esac
	clear
	echo -e "1) Найти пользователя\n2) Найти группу"
    done
}

menu()
{
    #начальный текст запроса
    PS3='Выберите задачу (help - помощь, q - выход): '

    OPTIONS=(
	"Управление пользователями"
	"Управление группами"
	"Поиск пользователей или групп"
    )

    FUNCTIONS=(
	control_user
	control_group
	search
    )

    select opt in "${OPTIONS[@]}"; do
    	#echo "Вы выбрали: $opt" 
	case $REPLY in
	    [1-${#OPTIONS[*]}])
		FUNC=${FUNCTIONS[$((REPLY-1))]}
		$FUNC || echo "Ошибка! Нужно реализовать функцию $FUNC" >&2
		break
		;;
	    help) 
		echo "Вам необходимо выбрать задачу, чтобы начать работу в данной программе.";;
	    q) exit 0;;
	    *) echo "Неверно выбрана задача!" >&2;;
	esac
	#echo -e "\n"
    done
}

main()
{
    inital
    menu
}

#проверка пользователя на права root
if [[ $EUID -ne 0 ]]; then
    echo "У Вас недостаточно прав для запуска данной программы."
    exit 1
fi
main
