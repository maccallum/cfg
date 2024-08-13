# export PURE_GIT_UNTRACKED_DIRTY=0
# zstyle :prompt:pure:path color green
# zstyle :prompt:pure:git:stash show yes

autoload -U promptinit; promptinit
#prompt elite2 yellow
prompt clint

HISTSIZE=99999
HISTFILESIZE=999999
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history

# Bash-like navigation
autoload -U select-word-style
select-word-style bash

alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias enw='\emacs -nw'
alias emacsx='\emacs'
alias emacs='enw'

if [[ -e "$HOME/.local.zsh" ]]; then
    source "$HOME/.local.zsh"
fi

export PATH="$PATH:/$HOME/.bin"
