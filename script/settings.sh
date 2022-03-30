#!/bin/bash

function settings {
	options="audio\nbrightness\ncancel"
	selected=$(echo -e $options | dmenu)
	if [[ $selected =  "audio" ]]; then
#>
		audioMenu="volume\nmicrophone"
		selectedAudio=$(echo -e $audioMenu | dmenu)
		if [[ $selectedAudio = "volume" ]]; then
			listVolume="0%\n10%\n20%\n30%\n40%\n50%\n60%\n70%\n80%\n90%\n100%"
			selectedVolume=$(echo -e $listVolume | dmenu)
			amixer set 'Master' $selectedVolume

		elif [[ $selectedAudio = "microphone" ]]; then
			muteUnmute="mute\nunmute"
			selectedMic=$(echo -e $muteUnmute | dmenu)
			amixer set Mic $selectedMic
	fi
#>
	elif [[ $selected = "brightness" ]]; then
#>  
	brightnessMenu="0.1\n0.2\n0.3\n0.4\n0.5\n0.6\n0.7\n0.8\n0.9\n1"
	selectedBrightness="$(echo -e $brightnessMenu | dmenu)"
	xrandr --output eDP1 --brightness $selectedBrightness
#>
	elif [[ $selected = "cancel" ]]; then
		return
	fi
}


settings
