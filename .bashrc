#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_completions ]; then
    . ~/.bash_completions
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

bind '"\C-f": "tmux-sessionizer\n"';

alias h='cd ~';
alias c=clear
alias hc='cd ~ && clear'

alias la='ls -a'
alias l='ls -lah'

alias gs='git status'
alias ga='git add .'
alias gc='git commit -m $@'
alias gp='git push'

function n(){
    # If an arg is given & it's a dir
    if [ ! -z "$1" ] && [ -d "$1" ]; then
        nvim --cmd "cd $1" -- "$1"
    # If an arg is given & it's a file
    elif [ ! -z "$1" ]; then
        nvim "$1"
    # No arg is given just open cur dir
    else
        nvim .
    fi
}

function note(){
    today=`date +%Y-%m-%d_%H-%M-%S`
    echo "date: $today" >> $HOME/notes.txt
    echo "$@" >> $HOME/notes.txt
    echo "" >> $HOME/notes.txt
}

VULKAN_SDK=$HOME/vulkanSDK/1.3.296.0/x86_64
export LD_LIBRARY_PATH="$VULKAN_SDK/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export VK_ADD_LAYER_PATH="$VULKAN_SDK/etc/vulkan/explicit_layer.d${VK_ADD_LAYER_PATH:+:$VK_ADD_LAYER_PATH}"
export PATH=$PATH:$VULKAN_SDK/bin

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.3.0/bin

eval "$(starship init bash)"

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
