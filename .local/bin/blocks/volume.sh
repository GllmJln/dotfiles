#!/bin/bash


rawActiveOutput=$(pacmd list-sinks | awk '/* index/{flag=1;next} /index/{flag=0}flag')
activeName=$(echo "$rawActiveOutput" | awk '/name:/ { gsub(/<|>/,"");print $2}')
activePort=$(echo "$rawActiveOutput" | awk '/active port:/ {gsub(/<|>|-/," ");print $5}')
activeVolume=$(echo "$rawActiveOutput" | awk '/volume: f/ {gsub(/%/,"");print $5}')
activeMuted=$(echo "$rawActiveOutput" | awk '/muted/ {print $2}')

#Get non-active sink info
rawPassiveOutput=$(pacmd list-sinks | awk '/index/{flag=1} /* index/{flag=0}flag')
passiveName=$(echo "$rawPassiveOutput" | awk '/name:/ { gsub(/<|>/,"");print $2}')
#Passive active port not required


if [[ $activePort == "headphones" ]]; then
	        ICON1='🎧'
elif [[ $activePort == "speaker" ]]; then
	        ICON1='💻'
	else
	        ICON1='🖥'

fi

if [ $activeVolume -lt 33 ]; then
	        ICON2='🔈'
elif [ $activeVolume -lt 66 ]; then
		ICON2='🔉'
	else 
		ICON2='🔊'
fi

if [ $activeMuted == "yes" ]; then
	        ICON2='🔇'
fi


printf "$ICON1%s""$activeVolume%%""$ICON2%s"

if [ "$1" == "up" ] && [ "$activeVolume" -lt 120 ]; then
	pactl set-sink-volume $activeName +5%
elif [ "$1" == "down" ]; then
	pactl set-sink-volume $activeName -5%
elif [ "$1" == "mute" ]; then
	pactl set-sink-mute $activeName toggle 
elif [ "$1" == "toggle-output" ]; then
	pactl set-default-sink $passiveName
fi
