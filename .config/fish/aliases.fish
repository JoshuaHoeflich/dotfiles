function sc
	printf "$PWD" > ~/.config/current_project
end

function gp
	cd (cat ~/.config/current_project)
end

alias aliases="nvim ~/.config/fish/aliases.fish"
alias c='clear'
alias e='exit'
alias fishrc='nvim ~/.config/fish/config.fish'
alias gcnf='cd ~/.config'
alias gnvim='cd ~/.config/nvim'
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
alias alacrittyrc='nvim ~/.config/alacritty/alacritty.yml'
alias gh='cd ~'
alias dots='nvim ~/.local/dotfiles.dots'
alias awesomerc='nvim ~/.config/awesome/rc.lua'
