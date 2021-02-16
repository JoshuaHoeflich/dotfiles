function sc
	printf "$PWD" > ~/.config/current_project
end

function gp
	cd (cat ~/.config/current_project)
end

alias alacrittyrc='nvim ~/.config/alacritty/alacritty.yml'
alias aliases="nvim ~/.config/fish/aliases.fish"
alias awesomerc='nvim ~/.config/awesome/rc.lua'
alias c='clear'
alias dots='nvim ~/.local/dotfiles.dots'
alias e='exit'
alias fishrc='nvim ~/.config/fish/config.fish'
alias gcnf='cd ~/.config'
alias ggh='cd ~/code/github'
alias gh='cd ~'
alias gnvim='cd ~/.config/nvim'
alias gscr='cd ~/code/scratch'
alias install='paru -S'
alias l='exa -l'
alias lh='exa -l -a'
alias ls='exa -l'
alias reload="source ~/.config/fish/aliases.fish"
alias rimraf='rm -rf'
alias update='paru -Syyu'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias xprofile='nvim ~/.xprofile'
alias git='hub'
