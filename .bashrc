#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

bind '"\C-f": "tmux-sessionizer\n"';

alias h='cd ~';
alias c=clear

alias la='ls -a'
alias l='ls -lah'

alias gs='git status'
alias ga='git add .'
alias gc='git commit -m $@'
alias gp='git push'

function n(){
    if [ -z "$1" ]; then
        nvim .
    else
        nvim "$1"
    fi
}

function note(){
    today=`date +%Y-%m-%d_%H-%M-%S`
    echo "date: $today" >> $HOME/notes.txt
    echo "$@" >> $HOME/notes.txt
    echo "" >> $HOME/notes.txt
}

eval "$(starship init bash)"
