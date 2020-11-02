#!/bin/sh
sh "$HOME"/.private.sh

xrdb -merge "$HOME"/.cache/wal/colors.Xresources
feh --bg-fill --randomize ~/pictures/wallpaper/*
autocutsel &
picom &
meteo-qt &
pasystray &

export EDITOR=/usr/bin/nvim
export SCRIPTPATH="$HOME"/.local/scripts
export ZDOTDIR="$HOME"/.config/zsh
export GOPATH="$HOME"/go
export BASEPATH=/home/joshua/.nix-profile/bin:/home/joshua/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

export PATH=$HOME/.local/bin:$GOPATH/bin:$SCRIPTPATH:$BASEPATH

exec awesome
