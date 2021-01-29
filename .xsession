#!/bin/sh
sh "$HOME"/.private.sh

export EDITOR=/usr/bin/nvim

export NIX_PATH="nixpkgs=$HOME/.nix-defexpr/channels/nixos"

export SCRIPTPATH="$HOME"/.local/scripts
export ZDOTDIR="$HOME"/.config/zsh
export GOPATH="$HOME"/go
export CARGOPATH="$HOME"/.cargo
export RUBYPATH=/home/joshua/.gem/ruby/2.7.0
export BASEPATH=/home/joshua/.nix-profile/bin:/home/joshua/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export PATH=$HOME/.local/bin:$GOPATH/bin:$CARGOPATH/bin:$RUBYPATH/bin:$SCRIPTPATH:$BASEPATH

xrdb -merge "$HOME"/.cache/wal/colors.Xresources
wallpaper
autocutsel &
picom &
dwmblocks &
exec hotdwm
