#!/bin/sh
alias aliases='nvim $HOME/.config/aliases.sh'
alias autoremove='paru -Rns $(paru -Qtdq)'
alias awesomerc='nvim $HOME/.config/awesome/rc.lua'
alias c='clear'
alias discord='Discord'
alias dots='nvim $HOME/.local/dotfiles.dots'
alias e='exit'
alias fixkeys='setxkbmap -option caps:swapescape -option ctrl:swap_lalt_lctl'
alias gawesome='cd $HOME/.config/awesome'
alias gb='cd $HOME/github/byteables'
alias gdwm='cd $HOME/github/joshuahoeflich/dwm'
alias gemacs='cd $HOME/.config/emacs'
alias ggh='cd $HOME/github'
alias gh='cd ~'
alias ginf='cd $INFRAPATH'
alias git='hub'
alias gitconfig='nvim $HOME/.gitconfig'
alias gjde='cd $HOME/github/joshuahoeflich/jde'
alias gls='cd ~/.local/scripts'
alias gms='cd ~/.local/scripts'
alias gnvim='cd $HOME/.config/nvim'
alias gp='cd "$(cat $HOME/.config/current_project)"'
alias gpp='cd $HOME/github/joshuahoeflich'
alias gql='cd /home/joshua/school/cs325/quicklisp/local-projects/'
alias gs='cd $HOME/school'
alias gscr='cd $HOME/scratch'
alias gserv='cd $HOME/github/joshuahoeflich/rubar/server/src'
alias gsnip='cd $HOME/.config/nvim/UltiSnips'
alias gsysd='cd $HOME/.config/systemd/user'
alias gwal='cd ~/pictures/wallpaper'
alias install='paru -S'
alias kittyrc='nvim $HOME/.config/kitty/kitty.conf'
alias l='exa -l -h --icons'
alias lh='exa -l -a -h --icons'
alias ls='exa -l -h --icons'
alias lw='rw lisp'
alias mcs='emacsclient'
alias mobar='nvim $HOME/.xmobarrc'
alias nin='nix-env -ir -f "$HOME"/.config/install.nix'
alias nprog='nvim "$HOME"/.config/install.nix'
alias nvim='nvim'
alias off='poweroff'
alias p='pnpm'
alias pb='nvim $HOME/.config/polyblocks/Config.toml'
alias raw='rw racket'
alias reload='unalias -a && . $HOME/.config/aliases.sh'
alias remove='paru -Rns'
alias rimraf='rm -rf'
alias sas='printf "%s" "$(sort ~/.config/aliases.sh | head -n -1 | sed -E "1s/^/#!\/bin\/sh\n/")" > ~/.config/aliases.sh'
alias sc='printf "%s" $PWD > $HOME/.config/current_project'
alias update='paru -Syyu'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vimrc='nvim $HOME/.config/nvim/init.vim'
alias xprofile='nvim $HOME/.xprofile'
alias xsession='nvim $HOME/.xsession'
alias yesrm='yes | rm -rf'
