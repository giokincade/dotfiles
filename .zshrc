
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [ -e $HOME/.zsh/$HOST.zsh ]; then
        source $HOME/.zsh/$HOST.zsh
fi

autoload -U compinit promptinit
compinit
promptinit
autoload -U colors && colors

export PROMPT="%{$fg_bold[blue]%}%F{208}%~%f%{$fg_bold[white]%}> %{$reset_color%}"
export RPROMPT="%{$fg_bold[yellow]%}%m%{$reset_color%}"

alias ls="ls -alsFGh"
alias g="git"
alias ack='ACK_PAGER_COLOR="less -x4SRFX" ack'

# History bits
HISTFILE=$HOME/.zsh/history 
HISTSIZE=1200
SAVEHIST=1000 
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY 
setopt inc_append_history
setopt sharehistory
