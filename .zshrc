. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/func
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# load rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
