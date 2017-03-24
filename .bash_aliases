#!/bin/bash

alias ..="cd .."
alias .-="cd -"
alias mv="mv -v"
alias cp="cp -v"
alias rm="rm -iv"
alias ll="ls -la"
alias pyserve="python -m SimpleHTTPServer 8000"
alias gosrc="cd $GOSRC"
alias vimrc="vim $HOME/.vimrc"
alias tmxa="tmux a -t"

##### The following aliases come from https://github.com/paulirish/dotfiles/blob/master/.aliases

# always use color, even when piping (to awk,grep,etc)
if gls --color > /dev/null 2>&1; then colorflag="--color"; else colorflag="-G"; fi;
export CLICOLOR_FORCE=1

# `cat` with beautiful colors. requires: sudo easy_install -U Pygments
alias cat='pygmentize -O style=monokai -f console256 -g'

# File size
alias fs="stat -f \"%z bytes\""
