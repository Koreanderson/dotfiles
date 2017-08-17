export PATH=/Applications/MAMP/bin/php/php5.5.3/bin:$PATH
export PATH=$PATH:/Applications/MAMP/Library/bin/
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
