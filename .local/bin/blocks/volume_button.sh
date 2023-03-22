#!/bin/sh
case $1 in
    1) pactl set-sink-mute @DEFAULT_SINK@ toggle && pkill -RTMIN+2 dwmblocks;;
    2) pactl set-sink-volume @DEFAULT_SINK@ 20% && pkill -RTMIN+2 dwmblocks;;
    3) volumeDisplay.sh toggle-output ;; 
    4) pavucontrol ;; 
esac
