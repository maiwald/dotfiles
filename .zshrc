. ~/.zsh/config
. ~/.zsh/aliases
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# load rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init - zsh)";
fi

# load fnm
eval "$(fnm env --use-on-cd)"
