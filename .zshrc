. ~/.zsh/config
. ~/.zsh/aliases
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# load rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init - zsh)";
fi

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
