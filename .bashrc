#!/bin/bash

# configure git status in shell prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=''

# add color to terminal
test -e ~/.dircolors && \
    eval `gdircolors -b ~/.dircolors`

alias ls="gls -G -F --color=always"
alias grep="grep --color=always"
alias egrep="egrep --color=always"

# tab completion for git commands
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# enable shorter git aliases: 'gco' instead of 'git co', etc.
function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}
for al in `__git_aliases`; do
    alias g$al="git $al"

    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete__func && __git_complete g$al $complete_func
done

# Solarized colors in the prompt
set_prompts() {
    local black=""
    local blue=""
    local bold=""
    local cyan=""
    local green=""
    local orange=""
    local purple=""
    local red=""
    local reset=""
    local white=""
    local yellow=""

    local hostStyle=""
    local userStyle=""

    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        tput sgr0 # reset colors

        bold=$(tput bold)
        reset=$(tput sgr0)

        # Solarized colors
        black=$(tput setaf 0)
        blue=$(tput setaf 33)
        cyan=$(tput setaf 37)
        green=$(tput setaf 64)
        orange=$(tput setaf 166)
        purple=$(tput setaf 125)
        red=$(tput setaf 124)
        white=$(tput setaf 15)
        yellow=$(tput setaf 136)
    else
        bold=""
        reset="\e[0m"

        black="\e[1;30m"
        blue="\e[1;34m"
        cyan="\e[1;36m"
        green="\e[1;32m"
        orange="\e[1;33m"
        purple="\e[1;35m"
        red="\e[1;31m"
        white="\e[1;37m"
        yellow="\e[1;33m"
    fi

    # build the prompt

    # logged in as root
    if [[ "$USER" == "root" ]]; then
        userStyle="\[$bold$red\]"
    else
        userStyle="\[$orange\]"
    fi

    # connected via ssh
    if [[ "$SSH_TTY" ]]; then
        hostStyle="\[$bold$red\]"
    else
        hostStyle="\[$yellow\]"
    fi

    # set the terminal title to the current working directory
    PS1="\[\033]0;\w\007\]"

    # PS1+="\n" # newline
    # PS1+="\[$userStyle\]\u" # username
    # PS1+="\[$reset$white\]@"
    # PS1+="\[$hostStyle\]\h" # host
    # PS1+="\[$reset$white\]:"
    # PS1+="\[$green\]\W"
    # PS1+="\[$reset$white\]/"
    # PS1+="\[$cyan\]\$(__git_ps1 '%s')"
    # PS1+="\n"
    # PS1+="\[$reset$white\]\$ \[$reset\]" # (and reset color)

    PS1+="\[$userStyle\]\u" # username
    PS1+="\[$reset$white\] at "
    PS1+="\[$hostStyle\]\h" # host
    PS1+="\[$reset$white\] in "
    PS1+="\[$green\]\W"
    if [ '$(__git_ps1)' ]; then
        PS1+="\[$reset$white\] on "
        PS1+="\[$cyan\]\$(__git_ps1 '%s')"
    fi
    PS1+="\n"
    PS1+="\[$reset$white\]\$ \[$reset\]" # (and reset color)
    export PS1
}
set_prompts
unset set_prompts

# tell React to use vim
export REACT_EDITOR=vim

export ANDROID_HOME=~/Library/Android/sdk
