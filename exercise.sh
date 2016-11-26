#menu
#!/bin/bash

#Created by Roza

#включить отладку
DEBUG=1

inital()
{
    clear
    echo "Управление пользователями и группами"
    echo -e "\nРазработчики:\nАбдуллаева Роза\nАлешин Максим\nЕлькин Дмитрий\nМатвеев Николай\nШишков Глеб\n"
}

#управление пользователями
control_user()
{
    clear
    #echo -e "\n"
    PS3='Выберите действие (help - помощь, menu - выход в главное меню): '

    #перечень пунктов меню управления пользователем
    OPTIONS=(
    	"Добавить пользователя"
    	"Удалить пользователя"
    	"Заблокировать пользователя"
	"Добавить пользователя в группу"
	"Сменить пароль пользователя"
    )
    
    select opt in "${OPTIONS[@]}"; do
#	if [[ &DEBUG == 1 ]]; then
#	    echo "opt=$opt"
#	    echo "REPLY=$REPLY"
#	fi
	case $REPLY in
	    1) chmod +x ./scripts/ia.sh
		./scripts/ia.sh;;
	    2) chmod +x ./scripts/ia.sh
		./scripts/ib.sh;;
	    3) chmod +x ./scripts.ia.sh
		./scripts/ic.sh;;
 	    4) chmod +x ./scripts/id.sh
		./scripts/ia.sh;;
	    5) chmod +x ./scripts/ie.sh
		./scripts/ib.sh;;
	    help) echo "Вам необходимо выбрать одно из предложенных действий для дальнейшей работы с пользователем.";;
	    menu)clear
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
    PS3='Выберите действие (help - помощь, menu - выход в главное меню): '

    OPTIONS=(
        "Добавить группу"
        "Удалить группу"
        "Изменить состав группы"
    )
    
     
    select opt in "${OPTIONS[@]}"; do
	if [[ $DEBUG == 1 ]]; then
	    echo "opt=$opt"
	    echo "REPLY=$REPLY"
	fi
	case $REPLY in
	    1) chmod +x ./scripts/iia.sh
		./scripts/iia.sh;;
	    2) chmod +x ./scripts/iib.sh
		./scripts/iib.sh;;
	    3) chmod +x ./scripts/iic.sh
		./scripts/iic.sh;;
	    help) echo "Вам необходимо выбрать одно из предложенных действий для дальнейшей работы с группой.";;
	    menu) clear
	    menu;;
	    *) echo "Неверно выбрано действие!" >&2;;
	esac
    done    
}

#поиск пользователей или групп
search()
{
    clear
    #echo -e "\n"
    PS3='Выберите действие (help - помощь, menu - выход в главное меню): '

    OPTIONS=(
        "Найти пользователя"
        "Найти группу"
    )

    select opt in "${OPTIONS[@]}"; do
	if [[ $DEBUG == 1 ]]; then
	    echo "opt=$opt"
	    echo "REPLY=$REPLY"
	fi
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
	    menu) 
		clear
		menu;;
	    *) echo "Неверно выбрано действие!" >&2;;
	esac
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
#	if [[ $DEBUG == 1 ]]; then
#    	    echo "opt=$opt" #opt содержит имя пункта меню, полезно для выбора пользователей или других объектов
#    	    echo "REPLY=$REPLY" #REPLY содержит ответ пользователя
#	fi
	case $REPLY in
	    [1-${#OPTIONS[*]}])
	    #с помощью данного хитрого способа можно автоматически перейти в нужную реализацию
		FUNC=${FUNCTIONS[$((REPLY-1))]}
#	    echo "Запускаю функцию $FUNC"
		$FUNC || echo "Ошибка! Нужно реализовать функцию $FUNC" >&2
		break
		;;
	    help) 
		echo "Вам необходимо выбрать задачу, чтобы начать работу в данной программе.";;
	    q) exit 0;;
	    *) echo "Неверно выбрана задача!" >&2;;
	esac
    done
}

main()
{
    inital
    menu
}

main
