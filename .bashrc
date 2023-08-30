# ~/.bashrc: executed by bash(1) for non-login shells.


case $- in
    *i*) ;;
      *) return;;
esac


# File history
HISTCONTROL=ignoreboth

shopt -s histappend

export HISTSIZE=1000000000
export HISTSIZE=
export HISTFILESIZE=200000000
export _JAVA_AWT_WM_NONREPARENTING=1
export TERMINAL="st"


shopt -s checkwinsize

shopt -s globstar

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac



if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then

	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then

    PS1="\[$(tput bold)\]\[\033[38;5;6m\]\u\[$(tput sgr0)\]\[\033[38;5;14m\]@\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;6m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;207m\]\w\[$(tput sgr0)\]\[\033[38;5;200m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"


    # Avoid duplicates
    HISTCONTROL=ignoredups:erasedups



else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

function killPort() {
	fuser -k $1/tcp
}


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

function cpr() {
  ticket="$(git branch --show-current | grep -Eo '(CB|cb)2-[0-9]+' | cut -d '-' -f 2)"
  body="$(sed s/XXXX/$ticket/g ./.github/pull_request_template | sed s/One line description/$1/g)"
  explorer.exe $(gh pr create --title "feat('${ticket,,}'): $1")
}

# alias
alias vim="nvim"

alias ls="ls --group-directories-first --color=auto"

alias swagger="docker run -d -p 80:8080 swaggerapi/swagger-editor"

alias hsearch='eval $(cat ~/.bash_history | fzf)'

alias sonarqube='docker container start sonarqube || docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:9.9-community'
    # && curl -u admin:admin -X POST "http://localhost:9000/api/users/change_password?login=admin&previousPassword=admin&password=123456"'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias wal="(sxiv -r -t Pictures/Wallpapers &)"





case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac



export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$HOME/sonar-scanner/bin"


# Might not be needed
# source /usr/share/git/completion/git-completion.bash

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.profile ]; then
    . ~/.profile
fi


# For bash completion of programmes
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


