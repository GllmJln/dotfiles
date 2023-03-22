#!/bin/sh

chosen=$(printf "%s\\nSuspend\\nReboot\\nShutdown" | dmenu -p "Select Power Option:") &&
case "$chosen" in
	"Suspend") systemctl suspend ;;
	"Reboot") reboot ;;
	"Shutdown") shutdown now ;;
esac

