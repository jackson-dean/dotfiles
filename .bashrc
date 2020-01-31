# .bashrc

#aliases
[ -r ~/.bash_aliases ] && source ~/.bash_aliases

#git prompt
[ -r ~/git-prompt.sh ] && source ~/git-prompt.sh

#git completion
[ -r ~/git-completion.bash ] && source ~/git-completion.bash

# Source global definitions
[ -r /etc/bashrc ] && source /etc/bashrc

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

GIT_PS1_SHOWDIRTYSTATE='y'
GIT_PS1_SHOWCOLORHINTS='y'
GIT_PS1_SHOWSTASHSTATE='y'
PROMPT_COMMAND='__git_ps1' # git info
PROMPT_COMMAND+=' "\[$pink\]\u' #username
PROMPT_COMMAND+='\[$yellow\]@' #at-sign
PROMPT_COMMAND+='\[$green\]\h' #hostname
PROMPT_COMMAND+=' \[$lt_blue\]\w\[$reset\]"' #working directory
PROMPT_COMMAND+=' "\[$lt_blue\]\n>\[$reset\] "' #cursor line
export PROMPT_COMMAND
export EDITOR=nvim
export BASH_SILENCE_DEPRECATION_WARNING=1 # silence zsh deprecaton warning for mac
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null || complete -o default -o nospace -F _git g

# use vim navigation in the terminal
set -o vi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

