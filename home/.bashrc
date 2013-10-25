source ~/.bash/util

PS1="\[$(tput bold)\]\[$(tput setaf 1)\]\w\\[$(tput setaf 4)\] $(__git_ps1 '(%s)') \[$(tput setaf 1)\]\n> \[$(tput sgr0)\]"

# RVM
PATH=$PATH:$HOME/.rvm/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
