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
<<<<<<< HEAD
elif [[ "$1" = "--logs" || "$1" = "-l" ]]; then
=======
elif [ "$1" = "--logs" ]; then
>>>>>>> 44ccec59a6fd6940caf49b6f2e58d36c6d90ee05
	echo "Invalid second argument"
fi

if [[ "$1" = "--help" || "$1" = "-h" ]]; then
	echo "type --date to display current date, --logs with optional second numerical argument to create log files, if no second argument is provided 100 log files will be created"
fi

if [[ "$1" = "--init" || "$1" = "-i" ]];then
	current_dir=$(pwd)
	git clone https://github.com/majfu/labo4 $current_dir
	export PATH="$current_dir:$PATH"
fi
