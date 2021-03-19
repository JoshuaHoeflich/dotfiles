#!/bin/sh
alias aliases='nvim $HOME/.config/aliases.sh'
alias c='clear'
alias dots='nvim ~/.local/dotfiles.dots'
alias e='exit'
alias install='paru -S'
alias l='exa -l'
alias lh='exa -l -a'
alias ls='exa -l'
alias reload='unalias -a && . $HOME/.config/aliases.sh'
alias rimraf='rm -rf'
alias update='paru -Syyu'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias zshrc='nvim ~/.zshrc'

dot()
{
    git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" "$@"
}

dotadd()
{
    while IFS="" read -r p || [ -n "$p" ]
    do
        case "$p" in
            \#*)
    	    ;;
             *)
    	    p="${HOME}/${p#"~/"}" # Replace ~ with the actual path
          dot add "$p"
        esac
    done < ~/.local/dotfiles.dots
}

dotpush()
{
    dotadd
    dot commit
    dot push main
}

fr()
{
   find "$PWD" -type f -not -path ".git/*" -not -path "node_modules/*" -not -path "target/*" -not -path "package-lock.json" -exec sed -i "s/$1/$2/g" {} \; 
}

gig()
{
    curl https://www.toptal.com/developers/gitignore/api/"$1" > .gitignore
}
