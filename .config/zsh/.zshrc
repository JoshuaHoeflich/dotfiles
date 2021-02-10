#!/usr/bin/env zsh
ZINIT_PATH=$ZDOTDIR/.zinit

if [ ! -d $ZINIT_PATH/bin ]; then
    git clone https://github.com/zdharma/zinit.git $ZINIT_PATH/bin
fi

if [ -f $HOME/.config/current_project ]; then
  cd `<$HOME/.config/current_project`
fi

source $ZINIT_PATH/bin/zinit.zsh
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light ael-code/zsh-colored-man-pages
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

eval "$(direnv hook zsh)"

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then 
  . "$HOME/google-cloud-sdk/path.zsh.inc";
fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then 
  . "$HOME/google-cloud-sdk/completion.zsh.inc"; 
fi
