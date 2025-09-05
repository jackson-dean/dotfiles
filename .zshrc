alias cl="clear"
alias cp="cp -v"
alias g="git"
alias ll="ls -la"
alias mv="mv -v"
alias pyserve="python -m SimpleHTTPServer 8000"
alias lzd="lazydocker"
alias acli_me='acli jira workitem search --jql "assignee = \"Jackson Dean\""'

if [ ! -z $(which fzf) ]; then
  source <(fzf --zsh)
  alias fd='cd $(awk '"'"'{print $2}'"'"' ~/Library/autojump/autojump.txt | fzf --height 75% --layout=reverse --border)'
fi

# always use color, even when piping (to awk,grep,etc)
if gls --color >/dev/null 2>&1; then colorflag="--color"; else colorflag="-G"; fi
export CLICOLOR_FORCE=1

# File size
alias fs="stat -f \"%z bytes\""

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Store the original prompt if not already stored
if [[ -z "$ORIGINAL_PROMPT" ]]; then
  ORIGINAL_PROMPT="$PS1"
fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

. "$HOME/.local/bin/env"

autoload -U compinit; compinit

export EDITOR="vim"
export BAT_THEME="gruvbox-dark"

eval "$(starship init zsh)"

[ -f ~/.polly_config ] && source ~/.polly_config

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jacksondean/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
