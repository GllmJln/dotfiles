#!/bin/sh
case $1 in 
	1) notify-send "Current time:" "$(date '+%a %d %B %H:%M:%S')" && pkill -RTMIN+5 dwmblocks ;;
esac
