#!/bin/sh
echo "$(xclip -o)" >> ~/.clip_list
notify-send "Saved to clipboatd" "$(xclip -o)"
