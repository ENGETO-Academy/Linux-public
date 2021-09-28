#!/bin/bash

ps1bcp=$PS1

# clear screen
clear

# hide cursor
tput civis

# reset prompt
PS1=

# get the size of terminal
lines=$(tput lines)
cols=$(tput cols)

words="A long time ago \e[9m in a galaxy \e[0m on a remote server\n
                    far, far away..."
wordslen=${#words}

# determine the middle of the terminal
midrows=$(bc <<< "$lines / 2")

# set cursor to position
tput cup $midrows 10

# intro words
echo -e "$words"
sleep 3

clear

# set cursor to the last line to create scrolling effect
tput cup $lines 0

# display crawling text
while IFS= read -r line;
do
    printf "%s\n" "$line";
    sleep 1
done < ./INTRO

# finish crawling by unwinding the text completely
for i in $(seq 1 $lines); do
    echo
    sleep 1
done

# display cursor
tput cvvis

# reset prompt
PS1=$ps1bcp
