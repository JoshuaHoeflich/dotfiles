#!/bin/sh
alias aliases='nvim $HOME/.config/aliases.sh'
alias c='clear'
alias dots='nvim ~/.local/dotfiles.dots'
alias e='exit'
alias fixgit='git remote set-head origin main'
alias git='hub'
alias gp='if [ -f ~/.config/current_project ]; then cd "$(cat ~/.config/current_project)"; fi'
alias install='paru -S'
alias l='exa -l'
alias lh='exa -l -a'
alias ls='exa -l'
alias mktool='printf "%s\n%s\n" "nodejs 14.16.0" "ruby 3.0.0" > .tool-versions'
alias reload='unalias -a && . $HOME/.config/aliases.sh'
alias rimraf='rm -rf'
alias sc='printf "%s" "$PWD" > ~/.config/current_project'
alias update='paru -Syyu'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias xprofile='nvim $HOME/.xprofile'
alias zshrc='nvim ~/.zshrc'

dot() {
	git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" "$@"
}

dotpush() {
	dotadd
	dot commit
	dot push -u origin main
}

dotadd() {
	while IFS="" read -r p || [ -n "$p" ]; do
		case "$p" in
		\#*) ;;

		*)
			p="${HOME}/${p#"~/"}" # Replace ~ with the actual path
			dot add "$p"
			;;
		esac
	done <~/.local/dotfiles.dots
}

fr() {
	find "$PWD" -type f -not -path ".git/*" -not -path "node_modules/*" -not -path "target/*" -not -path "package-lock.json" -exec sed -i "s/$1/$2/g" {} \;
}

gig() {
	curl https://www.toptal.com/developers/gitignore/api/"$1" >.gitignore
}

rtest() {
	lsafe "$@" | entr -c -r rails test
}
