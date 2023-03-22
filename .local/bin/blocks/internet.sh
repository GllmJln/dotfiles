#!/bin/bash

net="$(iwgetid -r)"
if [ -z "$net" ]; then
	icon="🚫"
else
  icon="🌐"
	net="${net:0:3}..${net: -3}"
fi
printf "$icon%s" "$net"

