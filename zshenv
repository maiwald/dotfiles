# add user .bin
export PATH="$HOME/.bin:$PATH"

# add npm bin to path
export PATH="/usr/local/share/npm/bin:$PATH"

# set homebrew bin before system bin
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# FZF with Git optimization
# https://github.com/junegunn/fzf
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find * -name ".*" -prune -o -type f -print -o -type l -print) 2> /dev/null'
