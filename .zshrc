
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

alias ls="ls -alsF --color"
alias g="git"
alias ack='ACK_PAGER_COLOR="less -x4SRFX" /usr/bin/ack'

