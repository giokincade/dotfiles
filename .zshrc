
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

# Git prompt
# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
function parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
function parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi

}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "| $(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}
export PROMPT='%{$fg[magenta]%}%n%{$reset_color%} @ %{$fg[yellow]%}%M%{$reset_color%}: %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%} $(git_prompt_string)  
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
alias dotfiles="cd ~/dotfiles"
alias g="git"
alias ack='ACK_PAGER_COLOR="less -x4SRFX" ack'
alias ag="ag --pager 'less -x4SRFX' "
alias resource='source ~/.zshrc'
alias pjson="python -m json.tool"

if [[ "$(uname)" != "Darwin" ]]; then
    alias pbcopy="ssh `echo $SSH_CLIENT | awk '{print $1}'` pbcopy"
    alias pbpaste="ssh `echo $SSH_CLIENT | awk '{print $1}'` pbpaste"
fi

