#!/bin/bash

function powermenu {
	options="shutdown\nreboot\nhibernate\ncancel"
	selected=$(echo -e $options | dmenu)
	if [[ $selected =  "shutdown" ]]; then
		poweroff 
	elif [[ $selected = "reboot" ]]; then
		reboot
	elif [[ $selected = "hibernate" ]]; then
		systemctl suspend
	elif [[ $selected = "cancel" ]]; then
		return
	fi
}


powermenu
