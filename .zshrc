cdpath=($HOME/Developer/Projects $HOME/Documents)

# Compensate for vim EDITOR variable
bindkey -e

# Modules

export ZLS_COLOURS
zstyle ':completion:*' list-colors ''
#
# Enable menu style completion
zstyle ':completion:*' menu yes select

# Search history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

fpath=(~/.zsh $fpath)

autoload -Uz compinit
autoload -Uz files
compinit

# Version Control Prompt
#
setopt prompt_subst
autoload -Uz vcs_info
# precmd() { vcs_info }
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git cvs svn
zstyle ':vcs_info:*' formats '[%b]%u%c'
zstyle ':vcs_info:*' actionformats '[%b|%a]%u%c'
zstyle ':vcs_info:*' unstagedstr '%{%F{red}%}%B!%b%{%f%}'
zstyle ':vcs_info:*' stagedstr '+'

PROMPT='%{%K{7}%}%n@%m:%B%1~%b${vcs_info_msg_0_}%#%{%k%} '
# PROMPT='%{%K{7}%}%n@%m:%B%1~%b$%#%{%k%} '

# Configuration management
#
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Other aliases
alias ls="ls -GF"
alias grep='grep --color'
alias df="df -h"
alias du="du -h"

