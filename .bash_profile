export PATH=/usr/local/bin:$PATH

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
export CLICOLOR=1 
export LSCOLORS=ExFxBxDxCxegedabagacad 
export EDITOR=vim


# git autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Display Git Branch
#parse_git_branch() {
     #git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}

# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

# set custom terminal prompt
export PS1="\u 🦊 \[\033[36m\]\w\[\033[33m\] $(parse_git_branch)\[\033[00m\] $ "
export PATH="$HOME/.rbenv/bin:$PATH"

# set vi as default editor
set -o vi

# export paths for node and homebrew
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/node@6/bin:$PATH"

# Container autocomplete
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi

# FZF Terminal Fuzzy Search
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Global Homestead Usage
function homestead() {
  ( cd ~/Homestead && vagrant $* )
}
# Aliases

alias ..='cd ..'
alias bashprofile='vim ~/.dot_files/.bash_profile'
alias dotfiles='cd ~/.dot_files'
alias vimrc='vim ~/.vimrc'
alias home='cd ~'
alias ls='ls -GFh'
alias ll='ls -FGlAhp'

# Source Bashrc for NVM
source ~/.bashrc

# Source Git Completion
source ~/git-completion.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rebind Ctrl T to Ctrl P for Fuzzy Search
bind '"\C-p": "\C-x\C-a$a \C-x\C-addi`__fzf_select__`\C-x\C-e\C-x\C-a0Px$a \C-x\C-r\C-x\C-axa "'

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"

# load shopify-app-cli, but only if present and the shell is interactive
#if [[ -f /Users/brian_noticed/.shopify-app-cli/shopify.sh ]]; then source /Users/brian_noticed/.shopify-app-cli/shopify.sh; fi
