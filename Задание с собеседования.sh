#!/bin/bash
#По заданию необходимо найти ссылки в файлах и открыть их. Допом дописал выввод ссылок в отдельный файл. 

files=$(ls)
if [ -z "$files" ]; then
    echo "Файлы не найдены в текущем каталоге."
    exit 1
fi
output_file="links.txt"

echo "Поиск ссылок во всех файлах в текущем каталоге..."
links=$(grep -Ero 'http[s]?://[^ ]+' *)

if [ -z "$links" ]; then
    echo "Ссылки не найдены."
    exit 0
fi
echo "$links" > "$output_file"
echo "Ссылки сохранены в файл $output_file"
echo "Найдены следующие ссылки:"
echo "$links"
echo "Запрос ссылок в консоли..."
for link in $links; do
    echo "Запрос к $link:"
    curl -I "$link"   # Показать только заголовки ответа
    echo "-----------------------------"
done

echo "Все ссылки обработаны."