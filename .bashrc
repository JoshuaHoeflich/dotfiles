#!/bin/sh
if [ -f "$HOME"/.config/aliases.sh ]; then
  . "$HOME"/.config/aliases.sh;
fi
export PS1="\\$\u@\W "
