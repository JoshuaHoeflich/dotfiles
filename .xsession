#!/usr/bin/env sh
set -e
# setxkbmap -option caps:swapescape 
# setxkbmap -option ctrl:ralt_rctrl
if [ -f ~/.cache/wal/colors.Xresources ]; then
  xrdb ~/.cache/wal/colors.Xresources
fi
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
picom &
# xrandr --output HDMI-2 --same-as eDP-1
exec xmonad
