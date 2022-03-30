#!/bin/bash

# dmenu2 power menu 
#

OPT=$(echo -e "suspend\npoweroff\nreboot" | dmenu )

case $OPT in
	suspend) sudo systemctl suspend   ;;
	poweroff) sudo systemctl poweroff ;;
	reboot) sudo systemctl reboot     ;;
	*) ;;
esac
