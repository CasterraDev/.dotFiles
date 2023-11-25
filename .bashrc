#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -a'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

bind '"\C-f": "tmux-sessionizer\n"';

alias home='cd ~';
alias nn='nn'

function nn(){
    if [ -z "$1" ]; then
        nvim .
    else
        nvim "$1"
    fi
}

eval "$(starship init bash)"
