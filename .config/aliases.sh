#!/bin/sh
alias aliases='nvim $HOME/.config/aliases.sh'
alias autoremove='nix-collect-garbage'
alias awesomerc='nvim $HOME/.config/awesome/rc.lua'
alias c='clear'
alias discord='Discord'
alias dots='nvim $HOME/.local/dotfiles.dots'
alias e='exit'
alias fixkeys='setxkbmap -option caps:swapescape -option ctrl:swap_lalt_lctl'
alias gawesome='cd $HOME/.config/awesome'
alias gb='cd $HOME/github/byteables'
alias gemacs='cd $HOME/.config/emacs'
alias ggh='cd $HOME/github'
alias gh='cd ~'
alias ginf='cd $INFRAPATH'
alias git='hub'
alias gitconfig='nvim $HOME/.gitconfig'
alias gjde='cd $HOME/github/joshuahoeflich/jde'
alias gmonad='cd $HOME/.xmonad'
alias gp='cd "$(cat $HOME/.config/current_project)"'
alias gpp='cd $HOME/github/joshuahoeflich'
alias gs='cd $HOME/school'
alias gserv='cd $HOME/github/joshuahoeflich/rubar/server/src'
alias gsysd='cd $HOME/.config/systemd/user'
alias gwal='cd ~/pictures/wallpaper'
alias install='nix-env -ir -f "$HOME"/github/joshuahoeflich/jde/install.nix'
alias kittyrc='nvim $HOME/.config/kitty/kitty.conf'
alias l='exa -l -h --icons'
alias lh='exa -l -a -h --icons'
alias ls='exa -l -h --icons'
alias mcs='emacsclient'
alias mobar='nvim $HOME/.xmobarrc'
alias mon='xrandr --output HDMI-2 --same-as eDP-1'
alias monload='xmonad --recompile; xmonad --restart'
alias monrc='nvim $HOME/.xmonad/xmonad.hs'
alias nixconf='nvim $HOME/.config/nixpkgs/config.nix'
alias off='poweroff'
alias pb='nvim $HOME/.config/polyblocks/Config.toml'
alias progs='nvim /home/joshua/github/joshuahoeflich/jde/install.nix'
alias reload='unalias -a && . $HOME/.config/aliases.sh'
alias rimraf='rm -rf'
alias sas='printf "%s" "$(sort ~/.config/aliases.sh | head -n -1 | sed -E "1s/^/#!\/bin\/sh\n/")" > ~/.config/aliases.sh'
alias sc='printf "%s" $PWD > $HOME/.config/current_project'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vimrc='nvim $HOME/.config/nvim/init.vim'
alias wallpaper='feh --bg-fill --randomize ~/pictures/wallpaper'
alias xmonadrc='nvim $HOME/.xmonad/xmonad.hs'
alias xprofile='nvim $HOME/.xprofile'
alias xsession='nvim $HOME/.xsession'
alias yesrm='yes | rm -rf'
alias zshenv='nvim $HOME/.config/zsh/.zshenv'
alias zshrc='nvim $HOME/.config/zsh/.zshrc'
