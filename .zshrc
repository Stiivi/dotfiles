# Host-specific
#
if [ -f "$HOME/.zshrc.preamble" ]; then
    source "$HOME/.zshrc.preamble"
fi

# Prevent homebrew from auto updating on install
export HOMEBREW_NO_AUTO_UPDATE=1

# Emacs-style line editing (compensate for the EDITOR variable)
bindkey -e

# Completion
#
export ZLS_COLOURS
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' completer _complete _ignored _files
zstyle ':completion:*' menu yes select

# Search history
#
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
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git cvs svn
zstyle ':vcs_info:*' formats '[%b]%u%c'
zstyle ':vcs_info:*' actionformats '[%b|%a]%u%c'
zstyle ':vcs_info:*' unstagedstr '%{%F{red}%}%B!%b%{%f%}'
zstyle ':vcs_info:*' stagedstr '+'

PROMPT='%n@%m:%B%1~%b${vcs_info_msg_0_}%# '

# Configuration management
#
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Other aliases
#
alias ls="ls -GF"
alias grep='grep --color'
alias df="df -h"
alias du="du -h"
alias edit="${EDITOR:-nvim}"

# PATH extensions
#
for _p in "$HOME/bin" "$HOME/.swiftpm/bin"; do
    [ -d "$_p" ] && PATH="$_p:$PATH"
done
unset _p

# Homebrew (macOS only). Skipped on machines without brew.
#
if command -v brew >/dev/null 2>&1; then
    brew_prefix="$(brew --prefix)"

    # GNU make (gnubin) in front of the BSD make
    [ -d "$brew_prefix/opt/make/libexec/gnubin" ] && PATH="$brew_prefix/opt/make/libexec/gnubin:$PATH"

    # Ruby via chruby — deterministic selection for a consistent environment
    if [ -d "$brew_prefix/opt/chruby/share/chruby" ]; then
        source "$brew_prefix/opt/chruby/share/chruby/chruby.sh"
        chruby ruby-3.1.3   # run `chruby` to see available versions
    fi
fi
export PATH

# Fuzzy finder (fzf) — use the modern generator; the old ~/.fzf.zsh is obsolete
#
if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
fi

# Host-specific post-amble (per-machine overrides; not versioned)
#
if [ -f "$HOME/.zshrc.postamble" ]; then
    source "$HOME/.zshrc.postamble"
fi
