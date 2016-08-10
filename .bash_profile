source /Users/matt/PayIt/DevEnvironment/environment_vars

# call ~/.bashrc, since it's not called automatically
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

PATH="~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:${PATH}"
export PATH
