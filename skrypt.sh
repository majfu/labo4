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
elif [[ "$1" = "--logs" || "$1" = "-l" ]] && [ -n "$2" ]; then
	echo "Invalid second argument"
fi

if [[ "$1" = "--help" || "$1" = "-h" ]]; then
	echo "type --help, -h for options, --date, -d to display current date. Type --logs, -l, --error, -e to create files, both with optional second numerical argument, if no second argument is provided 100 files will be created"
fi

if [[ "$1" = "--init" || "$1" = "-i" ]];then
	current_dir=$(pwd)
	git clone https://github.com/majfu/labo4 $current_dir
	export PATH="$current_dir:$PATH"
fi


if [[ "$1" = "--error" || "$1" = "-e" ]] && [ -z "$2" ]; then
	for ((i = 1; i <= 100; i++)); do
		mkdir error$i
		cd error$i
		touch error$i.txt
		current_date=$(date)
                echo "error$i.txt, skrypt.sh, $current_date" > error$i.txt
		cd ..
	done
elif [[ "$1" = "--error" || "$1" = "-e" ]] && ! [[ "$2" =~ "^[0-9]+$" ]]; then
	for ((i = 1; i <= $2; i++)); do
                mkdir error$i
                cd error$i
                touch error$i.txt
                current_date=$(date)
                echo "error$i.txt, skrypt.sh, $current_date" > error$i.txt
                cd ..
        done
elif [[ "$1" = "--error" || "1" = "-e" ]] && [ -n "$2" ]; then
	echo "Invalid second argument"
fi
