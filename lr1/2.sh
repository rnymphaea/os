#!/bin/bash

if [ $# -eq 0 ]; then
	echo "no file provided!"
	exit 1
fi

target="$1"

if [ ! -e "$target" ]; then
	echo "file doesn't exist!"
	exit 1
fi

output="2.log"

inode=$(ls -i "$target" | awk '{print $1}')

echo "Searching for hard links to '$target' (inode: $inode)" >> "$output"

sudo ls -liR / 2>/dev/null | awk -v inode="$inode" '
/:$/ { dir = substr($0, 1, length($0)-1); next }  # определяем текущий каталог
$1 == inode { print dir "/" $NF }  # выводим полный путь, если inode совпадает
' >> "$output"

echo "Search completed." >> "$output"

