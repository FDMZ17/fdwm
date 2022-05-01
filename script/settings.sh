#!/bin/bash

function settings {
	options="audio\nbrightness\ncast\ncancel"
	selected=$(echo -e $options | dmenu)
	if [[ $selected =  "audio" ]]; then
#>		
	pavucontrol
#>
	elif [[ $selected = "brightness" ]]; then
#>  
	brightnessMenu="0.1\n0.2\n0.3\n0.4\n0.5\n0.6\n0.7\n0.8\n0.9\n1"
	selectedBrightness="$(echo -e $brightnessMenu | dmenu)"
	xrandr --output eDP1 --brightness $selectedBrightness
#>
	elif [[ $selected = "cast" ]]; then
		screenMenu="DP1\nHDMI1\nHDMI2"
		selectedScreenMenu="$(echo -e $screenMenu | dmenu )"
	xrandr --output $selectedScreenMenu --same-as eDP1 
#>
	elif [[ $selected = "cancel" ]]; then
		return
	fi
}


settings
