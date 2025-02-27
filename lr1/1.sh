#!/bin/bash

if [ "$#" -eq 0 ]; then
	echo "No output file provided"
	exit 1
fi

output="$1"

find () {
	local type="$1"
	echo "Searching for file with type $type" >> "$output" 
    	sudo ls -lR / 2>/dev/null | awk -v type="$type" '
    	/:$/ { 
       		sub(/:$/, "", $0)   # убираем двоеточие в названии каталога
        	dir = $0            # сохраняем текущую директорию
        	next
    	}
    	$1 ~ "^" type {
        	if (dir == "/")
            	print $1, dir $NF; # усли в корне, не добавляем "/"
        	else
            	print $1, dir "/" $NF; # полный путь к файлу
        	exit
    	}
    ' >> "$output"
    echo "" >> "$output"
}

for type in "-" "b" "c" "d" "l" "p" "s"; do
	find "$type"
done


