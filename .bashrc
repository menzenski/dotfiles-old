
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# add color to 'ls'
# alias ls="ls -GFlash" # unsatisfactory
#
# load GNU aliases
#source /usr/local/Cellar/coreutils/8.24/aliases
#
# alias ls to GNU's alias
#alias ls='gls --color=auto'
#
# load GNU aliases
#source /usr/local/Cellar/coreutils/8.24/aliases

# add color to terminal
test -e ~/.dircolors && \
    eval `gdircolors -b ~/.dircolors`

alias ls="gls -G --color=always"
alias grep="grep --color=always"
alias egrep="egrep --color=always"
