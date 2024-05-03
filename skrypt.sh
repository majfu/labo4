#!/bin/bash

if [ "$1" = "--date" ]
then
	current_date=$(date)
	echo $current_date
fi
