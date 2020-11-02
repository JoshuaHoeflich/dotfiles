#!/bin/sh
xrdb -merge "$HOME"/.cache/wal/colors.Xresources
autocutsel &
picom &
export ZDOTDIR="$HOME"/.config/zsh
export GOPATH="$HOME"/go
export BASEPATH=/home/joshua/.nix-profile/bin:/home/joshua/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export PATH=$HOME/.local/bin:$GOPATH/bin:$BASEPATH
exec awesome
