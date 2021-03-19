#!/usr/bin/env zsh
ZINIT_PATH=$HOME/.zinit

if [ ! -d "$ZINIT_PATH/bin" ]; then
    git clone https://github.com/zdharma/zinit.git $ZINIT_PATH/bin
fi

if [ -f "$HOME"/.config/current_project ]; then
  cd "$(<"$HOME"/.config/current_project)" || exit 1
fi

if [ -f "$HOME"/.config/aliases.sh ]; then
  source "$HOME"/.config/aliases.sh;
fi

source "$ZINIT_PATH"/bin/zinit.zsh
zinit light zdharma/fast-syntax-highlighting
zinit light ael-code/zsh-colored-man-pages
zinit load agkozak/agkozak-zsh-prompt

eval "$(direnv hook zsh)"

. "$HOME"/.asdf/asdf.sh

fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit

export PATH="$HOME"/.local/bin:"$PATH"

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
