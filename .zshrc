
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [ -e $HOME/.zsh/$HOST.zsh ]; then
        source $HOME/.zsh/$HOST.zsh
fi

# Prompt bits 
autoload -U compinit promptinit
compinit
promptinit
autoload -U colors && colors
setopt promptsubst

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}
export PROMPT='%{$fg[magenta]%}%n%{$reset_color%} @ %{$fg[yellow]%}%M%{$reset_color%}: %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}
$(prompt_char) '

# History bits
mkdir -p $HOME/.zsh
HISTFILE=$HOME/.zsh/history 
HISTSIZE=1200
SAVEHIST=1000 
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY 
setopt inc_append_history
setopt sharehistory

# Shortcuts
alias ls="ls -alsFGh"
alias g="git"
alias ack='ACK_PAGER_COLOR="less -x4SRFX" ack'
alias resource='source ~/.zshrc'

