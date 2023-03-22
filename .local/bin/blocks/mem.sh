#!/bin/sh

mem=$(free -h | awk '/Mem/ { gsub(/i/,"");print $3 "/"$2 }')
ICON='🧠'
echo "$ICON $mem"
