# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval         "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal ||     echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*       alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# For ssh
alias root="ssh -l root"

# Tmux functions
function tmuxinit {
    if [ -z "$2" ]
    then
        ssh "$1" -t 'tmux new -s chrissul';
    else
        ssh "$1" -p "$2" -t 'tmux new -s chrissul';
    fi
}
export -f tmuxinit

function ta {
    if [ -z "$2" ]
    then
        ssh "$1" -t 'tmux a -t chrissul';
    else
        ssh "$1" -p "$2" -t 'tmux a -t chrissul';
    fi    
}
export -f ta

# For flushing dns
function flushdns {
    dscacheutil -flushcache;
    sudo killall -HUP mDNSResponder;
}
export -f flushdns

# Docker stuff
alias dup="docker-compose up"
alias dexec="docker exec -ti"

# For grace.umd.edu
alias grace="ssh -Y grace7.umd.edu"

alias c="clear"

# Directory traversal
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias -- -="cd -"

# Shortcuts
alias rr="rm -rf"

# Clean old git branches
alias gitclean="git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d"

alias vi="vim"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
