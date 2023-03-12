# This file is basically a big mess that needs sorting out
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '


export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.profile:$PATH"
export TERMINAL="st"


# Rename PS1
export PS1="\[$(tput bold)\]\[\033[38;5;6m\]\u\[$(tput sgr0)\]\[\033[38;5;14m\]@\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;6m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;207m\]\w\[$(tput sgr0)\]\[\033[38;5;200m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Avoid duplicates
HISTCONTROL=ignoredups:erasedups

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
export HISTSIZE=100000
export HISTSIZE=
# export HISTTIMEFORMAT="[%F %T] "

alias vim="nvim"

alias wal="(sxiv -r -t Pictures/Wallpapers &)"

alias ls="ls --group-directories-first --color=auto"

function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}
function stopwatch(){
  date1=`date +%s`; 
   while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
  done
}


source /usr/share/git/completion/git-completion.bash

shopt -s globstar

export _JAVA_AWT_WM_NONREPARENTING=1

