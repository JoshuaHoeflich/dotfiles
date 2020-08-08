#!/usr/bin/env sh
set -e
if [ -f ~/.cache/wal/colors.Xresources ]; then
  xrdb ~/.cache/wal/colors.Xresources
fi
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
picom &
xrandr --output HDMI-2 --same-as eDP-1
exec dwm
