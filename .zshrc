. ~/.zsh/config
. ~/.zsh/aliases
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# load fnm
eval "$(fnm env --use-on-cd)"
