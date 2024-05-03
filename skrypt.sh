#!/bin/bash
if [ "$1" = "--date" ]
then
	current_date=$(date)
	echo $current_date
fi

if [ "$1" = "--logs" ] && [ -z "$2" ]
then
	for ((i = 1; i <= 100; i++)); do
		touch log$i.txt
		current_date=$(date)
		echo "log$i.txt, skrypt.sh, $current_date" > log$i.txt
	done
fi


if [ "$1" = "--logs" ] && ! [[ "$2" =~ "^[0-9]+$" ]]; then
	for ((i = 1; i <= $2; i++)); do
                touch log$i.txt
                current_date=$(date)
                echo "log$i.txt, skrypt.sh, $current_date" > log$i.txt
	done
elif [ "$1" = "--logs" ]; then
	echo "Invalid second argument"
fi
