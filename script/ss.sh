#!/bin/bash

function ss {
	options="upload\nsave\ncopy\nrecent\nclear\ncancel"
	selected=$(echo -e $options | dmenu -l 10)
	if [[ $selected =  "upload" ]]; then
#>
		captureDate=$(date '+%d-%m-%y-%H:%M:%S')
		maim --select /tmp/${captureDate}.png
		url=$(curl -F file=@/tmp/${captureDate}.png https://0x0.st | grep -o 'http[s]*:[^"]*' | tr -d '\n')
		echo $url | xclip -sel c
		notify-send "Done!" "URL: $url \ncopied to clipboard"
		echo $url >> $HOME/.ss_list
#>
	elif [[ $selected = "save" ]]; then
#>
		ssDate=$(date '+%d-%m-%y-%H:%M:%S')
		maim --select ~/Pictures/ss/$ssDate.png
#>
	elif [[ $selected = "copy" ]]; then
#>
		maim --select | xclip -sel c -t image/png
#>
	elif [[ $selected = "recent" ]]; then
#>
		recentSelected=$(cat ~/.ss_list | dmenu -l 10)
		echo "$recentSelected" | xclip -sel c
		notify-send "Recent" "$recentSelected \ncopied to clipboard!"
#>
	elif [[ $selected = "clear" ]]; then
#>
		rm $HOME/.ss_list
#>
	elif [[ $selected = "cancel" ]]; then
		return
	fi
}


ss
