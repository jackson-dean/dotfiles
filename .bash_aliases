#!/bin/bash

alias cl="clear"
alias cp="cp -v"
alias g="git"
alias ll="ls -la"
alias mv="mv -v"
alias pyserve="python -m SimpleHTTPServer 8000"
alias vi="vim"
alias vscode-update="sudo apt update && sudo apt install code"
alias kill_postgres="sudo kill `lsof -i :6789 | awk 'NR==2 {print $2}'`"


if [ ! -z `which fzf` ]; then
    alias ff='vim $(fzf --height 75% --layout=reverse --border)'
    alias fd='cd $(awk '"'"'{print $2}'"'"' ~/.local/share/autojump/autojump.txt | fzf --height 75% --layout=reverse --border)'
    alias fb='git checkout $(git branch -a | fzf)'
    alias fh='eval $(history | awk '"'"'{ s = ""; for (i = 2; i <= NF; i++) s = s $i " "; print s }'"'"' | fzf)'
fi

##### The following aliases come from https://github.com/paulirish/dotfiles/blob/master/.aliases

# always use color, even when piping (to awk,grep,etc)
if gls --color > /dev/null 2>&1; then colorflag="--color"; else colorflag="-G"; fi;
export CLICOLOR_FORCE=1

# File size
alias fs="stat -f \"%z bytes\""

# deso stuff
alias kill_embedded_pg="sudo lsof -i :6789 | awk '{if (NR>1) {print\$2}}' | xargs sudo kill"
alias cpulimit_node="cpulimit -l 30 --pid=`ps aux | grep './backend run' | awk 'NR==1{print$2}'`"
