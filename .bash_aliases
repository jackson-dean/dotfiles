#!/bin/bash

alias cl="clear"
alias cp="cp -v"
alias g="git"
alias ll="ls -la"
alias mv="mv -v"
alias pyserve="python -m SimpleHTTPServer 8000"
alias vi="nvim"
alias vim="nvim"

##### The following aliases come from https://github.com/paulirish/dotfiles/blob/master/.aliases

# always use color, even when piping (to awk,grep,etc)
if gls --color > /dev/null 2>&1; then colorflag="--color"; else colorflag="-G"; fi;
export CLICOLOR_FORCE=1

# `cat` with beautiful colors. requires: sudo easy_install -U Pygments
if [ ! -z `which pygmentize` ]; then
  alias cat='pygmentize -O style=monokai -f console256 -g'
fi

# File size
alias fs="stat -f \"%z bytes\""
