#!/bin/bash

if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 1
    ~/.config/hypr/scripts/random-wallpaper.sh
fi
