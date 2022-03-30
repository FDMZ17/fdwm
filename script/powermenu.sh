#!/bin/bash

function powermenu {
	options="shutdown\nreboot\nhibernate\ncancel"
	selected=$(echo -e $options | dmenu)
	if [[ $selected =  "shutdown" ]]; then
		sudo poweroff 
	elif [[ $selected = "reboot" ]]; then
		sudo reboot
	elif [[ $selected = "hibernate" ]]; then
		sudo systemctl suspend
	elif [[ $selected = "cancel" ]]; then
		return
	fi
}


powermenu
