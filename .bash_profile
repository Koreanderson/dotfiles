export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ " 
export CLICOLOR=1 
export LSCOLORS=ExFxBxDxCxegedabagacad 
alias ls='ls -GFh'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Display Git Branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

set -o vi
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/node@6/bin:$PATH"

# Container autocomplete
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

# FZF Terminal Fuzzy Search
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Source Bashrc for NVM
source ~/.bashrc

# Rebind Ctrl T to Ctrl P for Fuzzy Search
bind '"\C-p": "\C-x\C-a$a \C-x\C-addi`__fzf_select__`\C-x\C-e\C-x\C-a0Px$a \C-x\C-r\C-x\C-axa "'

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"
