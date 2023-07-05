#/!bin/bash

echo " "
echo "  -------------------------------------------------------------------------"
echo "  |                               Здравствуйте!                           |"
echo "  |                                                                       |"
echo "  |       Это скрипт для запуска PHP + MySQL сайта в docker контейнере    |"
echo "  -------------------------------------------------------------------------"
echo "                                                                           "
echo " Давайте приступим:"
echo "                                                                           "
echo " Щаг 1 из 3. Введите путь к корневой дериктории варшего сайта (к примеру /var/www/html) "
read -p " Путь к дериктории: " pathtosite

if [ -d "$pathtosite" ]; then
  echo " "
  echo -e "\e[32mПапка обнаружена!\e[0m"
  echo " "
else
  echo " "
  echo -e " \e[31mПапка не существует!\e[0m"
  echo "  Выход из скрипта..."
  echo " "
  exit 1
fi

echo "-------------------------------------------------------------------------"
echo " "
echo "  Щаг 2 из 3. Будет ли в вашем сайте связь с MySQL?"
echo " "
echo "   Введите "1" - если будет привязка к MySQL."
echo "   Введите "2" - если MySQL устанавливать не надо."
echo " "

while true; do
    # Запрос ввода от пользователя
    read -p "  Введите число 1 или 2: " countmysql
    # Проверка введенного значения
    if [ "$countmysql" == "1" ]; then
        echo " "
        echo "  Отлично! Вы выбрали число 1"
        echo "-------------------------------------------------------------------------"
        echo " "
        echo "  Введите путь к файлу database.sql"
        echo " "
        echo -e " \e[33m Обратите внимание, что файл вашей базы данных должен называться именно database.sql !\e[0m "
        echo -e " \e[33m Для выгрузки базы данных файл выйдите из скрипта (Ctrl + C) и \e[0m "
        echo -e " \e[33m выполните команду\e[0m \e[32m mysqldump -u <пользователь> -p <имя_базы_данных> > database.sql \e[0m "
        echo -e " \e[33m После это файл сохранится в каталоге, из которого вы выполнили эту команду\e[0m "
        echo " "
        read -p "  Путь к файлу database.sql (например, /var/lib/mysql/database.sql): " pathtomysql

        if [ -f "$pathtomysql" ]; then
           echo " "
           echo -e "\e[32mФайл обнаружен!\e[0m"
           echo " "
        else
           echo " "
           echo -e " \e[31mФайл не найден!\e[0m"
           echo "  Выход из скрипта..."
           echo " "
           exit 1
        fi

        break
    elif [ "$countmysql" == "2" ]; then
        echo "Вы выбрали число 2"
        # Ваше сообщение при вводе 2 будет здесь
        break
    else
        echo -e " \e[31mВведено некорректное значение!\e[0m"
    fi
done


# if [ "$countmysql" = "1"]; then
#   echo " "
#   echo -e "\e[32mПапка обнаружена!\e[0m"
#   echo " "
# elif [ "$countmysql" = "2"]; then
#   echo " "
#   echo -e "\e[32mПапка обнаружена!\e[0m"
#   echo " "  
# else
#   echo " "
#   echo -e " \e[31mD\e[0m"
#   echo "  Выход из скрипта..."
#   echo " "
#   exit 1
# fi
