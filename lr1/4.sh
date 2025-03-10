#!/bin/bash

if [ $# -eq 0 ]; then
	echo "no file provided"
	exit 1
fi

target="$1"
output="4.log"

echo "Search with find + -lname" >> "$output"
sudo find / -lname $target 2>/dev/null >> "$output"
echo "" >> "$output"

echo "Search with ls + grep" >> "$output"
sudo ls -lRa / 2>/dev/null | grep ^l | grep "$target" >> "$output"
echo "" >> "$output"
