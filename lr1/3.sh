#!/bin/bash

if [ $# -eq 0 ]; then
    echo "no file provided"
    exit 1
fi

target="$1"

output="out.txt"
logfile="3.log"

ls -lR / 2>/dev/null | grep "$target" | grep ^l | awk '{print $0}' >> "$output"

count=$(wc -l < "$output")

cat "$output" >> "$logfile"
echo -e "total $count\n" >> "$logfile"

rm $output
