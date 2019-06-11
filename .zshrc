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

# Prompt
setopt prompt_subst
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git cvs svn
zstyle ':vcs_info:*' formats '(%u%b)'
zstyle ':vcs_info:*' unstagedstr '%{%F{red}%}*%{%f%}'
zstyle ':vcs_info:*' stagedstr '+'


PROMPT='%n@%m:%B%1~%b${vcs_info_msg_0_}%# '
