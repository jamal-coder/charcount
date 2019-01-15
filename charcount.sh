#!/bin/bash
boldgreen="\033[1;32m"
fleshred="\033[5;31m"
normal="\033[0m"
characters=0
numbers=0
special=0
total=0
clear
if [ $# -eq 1 ]; then

	file $1 | grep -i 'ascii text'

	if [[ -f $1 && $? -eq 0 ]]; then
		while read LINE
		do
			word=$(echo $LINE)
			length=${#word}
			for((count=0; count<length; count++)); do
				char=${word:$count:1}
				((total++))
				case $char in
					[A-Za-z]) ((characters++));;
					[0-9]) ((numbers++));;
					*)	   ((special++));;
				esac
			done
		done < $1
		clear
		echo -e $boldgreen"\n\n\t\tSummery Sheet : $1"$normal
		echo -e "\t\t----------------------------------------------"
		echo -e "\t\tLetters    	   : $characters"
		echo -e "\t\tNumbers            : $numbers"
		echo -e "\t\tSpecial Characters : $special"
		echo -e "\t\tTotal Characters   : $total"
		echo -e "\t\t----------------------------------------------\n\n\n"
	else
		echo -e $fleshred"\n\n\t\t$1 is not a Regular File\n\n"$normal
	fi
else
	echo -e $boldgreen"\n\n\t\tUsage: "$normal$fleshred"<charcount.sh> <FileName>"$normal$boldgreen" - One file should be given as online argument.\n\n"$normal
fi