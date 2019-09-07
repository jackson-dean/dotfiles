# .bashrc

#aliases
[ -r ~/.bash_aliases ] && source ~/.bash_aliases

#functions
[ -r ~/.bash_functions ] && source ~/.bash_functions

#git prompt
[ -r ~/.git-prompt.sh ] && source ~/.git-prompt.sh

#git completion
[ -r ~/.git-completion.bash ] && source ~/.git-completion.bash

#git aliases
[ -r ~/.git_aliases ] && source ~/.git_aliases

# Source global definitions
[ -r /etc/bashrc ] && source /etc/bashrc

# local/machine specifc config
[ -r ~/.bashrc.local ] && source ~/.bashrc.local

# Terminal fuzzy file search
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#terminal colors
black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)
bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

export GOPATH=$HOME/work
export GOSRC=$GOPATH/src/github.com/jackson-dean
export PS1='\[$pink\]\u\[$yellow\]@\[$green\]\h:\[$black\]\[$lt_blue\]\w\[$black\] \[\033[0;33m\]$(__vcs_name)\[\033[00m\]\n\[$reset\]\[$reset\]\$ '
export EDITOR=nvim
export PROMPT_COMMAND='printf "\033]0;%s\007" $(basename "$PWD")'
export PATH=$PATH:"/usr/local/bin":$GOPATH/bin
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null || complete -o default -o nospace -F _git g

### for digital ocean deployments
export DROPLET_2_IP='138.197.203.137'
export DROPLET_2_USER='jldean'

# use vim navigation in the terminal
set -o vi

eval "$(hub alias -s)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

