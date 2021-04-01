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

alias vi="vim"

alias ports='netstat -tulanp'

alias grepe="grep -rnw . -e" 

# For ssh
alias root="ssh -l root"

alias prunemergedbranches='git checkout master && git pull && git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d; git fetch --prune'

# Docker stuff
alias dup="docker-compose up"
alias dexec="docker exec -ti"

alias c="clear"

# Clean old git branches
alias gitclean="git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d"

alias vi="vim"

