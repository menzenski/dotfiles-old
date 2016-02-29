
# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by Anaconda 2.2.0 installer
export PATH="/Users/mattmenzenski/anaconda/bin:$PATH"

##
# Your previous /Users/mattmenzenski/.bash_profile file was backed up as /Users/mattmenzenski/.bash_profile.macports-saved_2015-07-21_at_09:46:20
##

# MacPorts Installer addition on 2015-07-21_at_09:46:20: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# add Postgres.app's psql command line tools
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
# include Anaconda libraries in the $DYLD_FALLBACK_LIBRARY_PATH
export DYLD_FALLBACK_LIBRARY_PATH=$HOME/anaconda/lib/:$DYLD_FALLBACK_LIBRARY_PATH

# go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# call ~/.bashrc, since it's not called automatically on OS X
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
