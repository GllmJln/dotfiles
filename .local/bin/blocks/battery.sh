#!/bin/bash
ICON="🔥"
read -r capacity </sys/class/power_supply/BAT0/capacity
read -r status </sys/class/power_supply/BAT0/status

if [ "$status" == "Discharging" ]; then
	ICON="🔋"
elif [ "$status" == "Charging" ]; then
	ICON="🔌"
elif [ "$status" == "Not charging" ]; then
	ICON="🔴"
fi

if [ "$status" == "Charging" ] && [ "$capacity" -eq "100" ]; then
	ICON="🔥"
	notify-send -i ~/Pictures/Icons/full_battery.png -t 3000 "Battery fully charged!" "Battery level is $capacity"
elif [ "$status" == "Discharging" ] && [ $capacity -lt 15 ] && [ $capacity -gt 5 ]; then
	notify-send -i ~/Pictures/Icons/low_battery.png -t 10000 "Low Battery" "Battery level is $capacity"
elif [ "$status" == "Discharging" ] && [ $capacity -lt 5 ]; then
	notify-send -u -i ~/Pictures/Icons/low_battery.png -t 1000 "Low Battery" "Battery level is $capacity"
  shutdown now
fi
printf "$ICON%s%%" "$capacity"
