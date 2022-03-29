#!/bin/bash

# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto


dunst &
dwmblocks &
picom --experimental-backends &
numlockx &
(sleep 0.2 && Screen default) &
[ ! -s ~/.config/mpd/pid ] && mpd &
mpDris2 &
sxhkd &
(sleep 0.2 && Wallpaper )&
export _JAVA_AWT_WM_NONREPARENTING=1 &
export AWR_TOOLKIT=MToolkit &
wmname LG3D &
exec dwm
