# Initialization

system=`uname -s`

# Host-specific configuration pre-amble
if [ -f "${HOME}/.profile.preamble" ]; then
    source ${HOME}/.profile.preamble
fi


# Paths
#

export PATH="$HOME/bin:$PATH"

case $system in
    Darwin)
        DEVELOPER_PATH="${HOME}/Developer"
        PROJECTS_PATH="${DEVELOPER_PATH}/Projects"
        DOCS_PATH="${HOME}/Documents"
        # Swift executable
        export PATH="/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:${PATH}"
        ;;
    Linux)
        DEVELOPER_PATH="${HOME}/devel"
        PROJECTS_PATH="${DEVELOPER_PATH}/projects"
        DOCS_PATH="${HOME}/docs"
        ;;
esac

# cd path
export CDPATH=".:~:${DEVELOPER_PATH}:${PROJECTS_PATH}:${DOCS_PATH}"

# Python environments
export PYTHON_ENVIRONMENTS=${DEVELOPER_PATH}/python-venv

# Editor
export EDITOR=vim

# Git completion
#
if [ -f "${HOME}/bin/git-prompt.sh" ]; then
    export GIT_PROMPT_ONLY_IN_REPO=1
    export GIT_PROMPT_FETCH_REMOTE_STATUS=0

    GIT_PS1_SHOWUPSTREAM="auto"
    GIT_PS1_SHOWCOLORHINTS="yes"
    source ~/bin/git-prompt.sh
    PS1='\u@\h:\[\e[1;37m\]\W\[\e[0m\]$(__git_ps1 " (%s)")\$ '
    export PS1
fi

# Terminal configuration
#
export TERM=xterm-256color-italic


source ${HOME}/.bash_aliases
source ${HOME}/.bash_functions

# Host-specific configuration postamble
if [ -f "${HOME}/.profile.postamble" ]; then
    source ${HOME}/.profile.postamble
fi
