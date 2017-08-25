. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/func
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# initialize Nix
if [ -e /Users/maiwald/.nix-profile/etc/profile.d/nix.sh ]; then
  . /Users/maiwald/.nix-profile/etc/profile.d/nix.sh;
fi

# load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# load nvm
if [ -e /usr/local/opt/nvm/nvm.sh ]; then
  export NVM_DIR="$HOME/.nvm"
  . /usr/local/opt/nvm/nvm.sh;
fi
