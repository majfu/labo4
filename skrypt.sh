#!/bin/bash
if [ "$1" = "--date" ] || [ "$1" = "-d" ]
then
	current_date=$(date)
	echo $current_date
fi

if [[ "$1" = "--logs" || "$1" = "-l" ]] && [ -z "$2" ]
then
	for ((i = 1; i <= 100; i++)); do
		touch log$i.txt
		current_date=$(date)
		echo "log$i.txt, skrypt.sh, $current_date" > log$i.txt
	done
fi


if [[ "$1" = "--logs" || "$1" = "-l" ]] && ! [[ "$2" =~ "^[0-9]+$" ]]; then
	for ((i = 1; i <= $2; i++)); do
                touch log$i.txt
                current_date=$(date)
                echo "log$i.txt, skrypt.sh, $current_date" > log$i.txt
	done
elif [[ "$1" = "--logs" || "$1" = "-l" ]]; then
	echo "Invalid second argument"
fi

if [[ "$1" = "--help" || "$1" = "-h" ]]; then
	echo "type --help, -h for options, --date, -d to display current date, --logs, -l, --error, -e, both with optional second numerical argument to create files, if no second argument is provided 100 files will be created"
fi
