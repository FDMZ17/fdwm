#!/bin/bash

function powermenu {
	options="list\nclear\ncancel"
	selected=$(echo -e $options | dmenu)
	if [[ $selected =  "list" ]]; then
		clipList=$(cat ~/.clip_list | dmenu -l 10)
		echo "$clipList" | xclip -sel c
		notify-send "Copied to clipboard!" "$clipList"
		# echo $(cat ~/.clip_list | dmenu -l 10)| tr -d '\n' | xclip -sel c
	elif [[ $selected = "clear" ]]; then
		rm ~/.clip_list
	elif [[ $selected = "cancel" ]]; then
		return
	fi
}


powermenu
