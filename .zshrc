. ~/.zsh/config
. ~/.zsh/aliases

# load fzf keybindings and fuzzy completion
if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
fi

# load fnm
if command -v fnm >/dev/null 2>&1; then
    eval "$(fnm env --use-on-cd)"
fi
