#!/bin/sh
alias aliases='nvim $HOME/.config/aliases.sh'
alias autoremove='nix-collect-garbage'
alias awesomerc='nvim $HOME/.config/awesome/rc.lua'
alias c='clear'
alias dots='nvim $HOME/.local/dotfiles.dots'
alias e='exit'
alias fixkeys='setxkbmap -option caps:swapescape -option ctrl:swap_lalt_lctl'
alias gawesome='cd $HOME/.config/awesome'
alias gemacs='cd $HOME/.config/emacs'
alias ggh='cd $HOME/github'
alias gh='cd ~'
alias ginf='cd $INFRAPATH'
alias gitconfig='nvim $HOME/.gitconfig'
alias gmonad='cd $HOME/.xmonad'
alias gp='cd "$(cat $HOME/.config/current_project)"'
alias gpp='cd $HOME/github/joshuahoeflich'
alias gserv='cd $HOME/github/joshuahoeflich/rubar/server/src'
alias gsysd='cd $HOME/.config/systemd/user'
alias install='nix-env --set'
alias kittyrc='nvim $HOME/.config/kitty/kitty.conf'
alias l='exa -l -h --icons'
alias lh='exa -l -a -h --icons'
alias ls='exa -l -h --icons'
alias mcs='emacsclient'
alias mobar='nvim $HOME/.xmobarrc'
alias monload='xmonad --recompile; xmonad --restart'
alias monrc='nvim $HOME/.xmonad/xmonad.hs'
alias mon='xrandr --output HDMI-2 --same-as eDP-1'
alias nixconf='nvim $HOME/.config/nixpkgs/config.nix'
alias off='poweroff'
alias progs='nvim $HOME/.nix-defexpr/default.nix'
alias reload='unalias -a && . $HOME/.config/aliases.sh'
alias rimraf='rm -rf'
alias sas='printf "%s" "$(sort ~/.config/aliases.sh | head -n -1 | sed -E "1s/^/#!\/bin\/sh\n/")" > ~/.config/aliases.sh'
alias sc='printf "%s" $PWD > $HOME/.config/current_project'
alias update='nix-env -u && nix-env --set'
alias vim='nvim'
alias vimrc='nvim $HOME/.config/nvim/init.vim'
alias vi='nvim'
alias v='nvim'
alias xmonadrc='nvim $HOME/.xmonad/xmonad.hs'
alias xprofile='nvim $HOME/.xprofile'
alias xsession='nvim $HOME/.xsession'
alias yesrm='yes | rm -rf'
alias zshenv='nvim $HOME/.config/zsh/.zshenv'
alias zshrc='nvim $HOME/.config/zsh/.zshrc'
