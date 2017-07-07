. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/func
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# initialize Nix
if [ -e /Users/maiwald/.nix-profile/etc/profile.d/nix.sh ]; then
  . /Users/maiwald/.nix-profile/etc/profile.d/nix.sh;
fi
