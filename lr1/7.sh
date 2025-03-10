#!/bin/bash

filesize=1M
namedir="7"

mkdir $namedir
cd $namedir

echo -e "Создан каталог $namedir\n"
echo -e "Начальный размер каталога: $(du -sb . | awk '{print $1}') байт\n"

sizeb() {
	du -sb . | awk '{print $1}'
}

sizeh() {
	du -sh . | awk '{print $1}'
}

for i in {1..5}; do
	dd if=/dev/zero of=file_$i bs=$filesize count=1
	echo "Добавлен файл file_$i с размером $filesize. Размер каталога: $(sizeh) ($(sizeb) байт)"
done

echo

for i in {1..5}; do
	rm file_$i
	echo "Удален файл file_$i c размером $filesize. Размер каталога: $(sizeh) ($(sizeb) байт)"
done

cd ../ && rm -rf $namedir

