# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz compinit
compinit

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

__define_git_completion () {
eval "
    _git_$2_shortcut () {
        COMP_LINE=\"git $2\${COMP_LINE#$1}\"
        let COMP_POINT+=$((4+${#2}-${#1}))
        COMP_WORDS=(git $2 \"\${COMP_WORDS[@]:1}\")
        let COMP_CWORD+=1

        local cur words cword prev
        _get_comp_words_by_ref -n =: cur words cword prev
        _git_$2
    }
"
}

__git_shortcut () {
    type _git_$2_shortcut &>/dev/null || __define_git_completion $1 $2
    alias $1="git $2 $3"
    complete -o default -o nospace -F _git_$2_shortcut $1
}

__git_shortcut gco checkout
__git_shortcut gd diff
__git_shortcut gdc diff --cached
__git_shortcut gc commit -m
__git_shortcut gca commit '--amend -C HEAD'
__git_shortcut gcA commit '--amend -m'
__git_shortcut gp push
__git_shortcut ga add
__git_shortcut gap add -p
__git_shortcut gr reset
__git_shortcut gsw show
__git_shortcut gpl pull
__git_shortcut gplr pull '--rebase origin master'

alias gs='git status'
alias gl='git lg'
alias glb="git for-each-ref --count=5 --sort=-committerdate refs/heads/ --format='%(color:yellow)%(refname:short)%(color:reset) %0a %(subject)'"

export PATH="/usr/local/opt/gettext/bin:$PATH"

[ -n "$TMUX" ] && export TERM=screen-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag -s -g ""'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/chronos/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/chronos/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/chronos/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/chronos/google-cloud-sdk/completion.zsh.inc'; fi

export LC_ALL=en_US.UTF-8

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/chronos/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;