export PATH="$HOME/.bin:$PATH"

# add npm bin to path
export PATH="/usr/local/share/npm/bin:$PATH"

# set homebrew bin before system bin
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
