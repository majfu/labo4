#!/bin/bash

if [ "$1" = "--date" ]
then
	current_date=$(date)
	echo $current_date
fi

if [ "$1" = "--logs" ]
then
	for ((i = 1; i <= 100; i++)); do
		touch log$i.txt
		current_date=$(date)
		echo "log$i.txt, skrypt.sh, $current_date" > log$i.txt
fi
