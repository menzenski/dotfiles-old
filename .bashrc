
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# add color to 'ls'
# alias ls="ls -GFlash" # unsatisfactory

# add color to terminal
test -e ~/.dircolors && \
    eval `gdircolors -b ~/.dircolors`

alias ls="gls -G -F --color=always"
alias grep="grep --color=always"
alias egrep="egrep --color=always"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
