#!/bin/sh

echo "$(xclip -o)" | tr -d '' >> ~/.clip_list
