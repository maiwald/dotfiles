# language
export LANG=en_US.UTF-8
export LC_TIME=de_DE.UTF-8
export LC_NUMERIC=de_DE.UTF-8

# add user .bin
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# add npm bin to path
export PATH="/usr/local/share/npm/bin:$PATH"

# set homebrew bin before system bin
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# set terminfo on macOS
if [[ `uname` == 'Darwin' ]]; then
  export TERMINFO="/usr/share/terminfo"
fi

# go lang
export GOPATH=$HOME/.golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
