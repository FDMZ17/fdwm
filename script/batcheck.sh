#!/bin/bash
capacity=$(cat /sys/class/power_supply/BAT1/capacity)
if [[ $capacity < 101 ]]; then
	notify-send "Warning!" "Low battery"
	lowbat="Please charge your laptop\nOk"
	echo -e $lowbat | dmenu -l 2
	sleep 300
fi

if [[ $capacity > 5 ]]; then
	notify-send "WARNING!" "Shutting down in 2 min..."
	sleep 120
	poweroff
fi
