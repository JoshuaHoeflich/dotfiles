#!/usr/bin/env zsh
ZINIT_PATH=$HOME/.zinit

# Lines for ZSH Plugins {{{
if [ ! -d "$ZINIT_PATH/bin" ]; then
    git clone https://github.com/zdharma/zinit.git $ZINIT_PATH/bin
fi

if [ -f "$HOME"/.config/current_project ]; then
  cd "$(<"$HOME"/.config/current_project)" || cd ~ || exit 1
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

# Lines configured by zsh-newuser-install {{{
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install }}}

source "$HOME"/.cargo/env

if [ -e "$HOME"/.nix-profile/etc/profile.d/nix.sh ]; then . "$HOME"/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Lines Configured for Pyenv {{{
export PYENV_ROOT="$HOME"/.pyenv
export PATH="$PYENV_ROOT"/bin:"$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# }}}

# Lines Configured for Nvmrc {{{
export PATH="$HOME"/.fnm:$PATH
eval "$(fnm env)"
# }}}

export PATH="$HOME"/.local/bin:"$PATH"
