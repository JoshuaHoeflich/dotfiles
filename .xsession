#!/usr/bin/env sh
set -e
polyblocks --output xsetroot &
if [ -f ~/.cache/wal/colors.Xresources ]; then
  xrdb ~/.cache/wal/colors.Xresources
fi
feh --bg-fill --randomize ~/pictures/wallpaper/*
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
picom &
xrandr --output HDMI-2 --left-of eDP-1
exec dwm
