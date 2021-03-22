#!/usr/bin/env zsh
ZINIT_PATH=$HOME/.zinit

# Lines for ZSH Plugins {{{
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
# End of lines configured for ZSH Plugins }}}

eval "$(direnv hook zsh)"

# Lines configured for asdf {{{
. "$HOME"/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit
# End of liens configured for asdf }}}

# Lines configured by zsh-newuser-install {{{
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install }}}

export PATH="$HOME"/bin:"$HOME"/.local/bin:"$PATH"
