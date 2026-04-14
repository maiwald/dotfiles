if command -v rg >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --glob=\!.git'
fi

if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
fi
