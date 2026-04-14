# Loaded for interactive shells

source ~/.zsh/shell.zsh
source ~/.zsh/aliases.zsh

# Tool setup
source ~/.zsh/git.zsh
source ~/.zsh/go.zsh
source ~/.zsh/zvm.zsh
source ~/.zsh/bat.zsh
source ~/.zsh/docker.zsh
source ~/.zsh/fnm.zsh
source ~/.zsh/fzf.zsh

# Completion system
autoload -Uz compinit
compinit

# Optional machine-local overrides
[[ -f ~/.zsh/local.zsh ]] && source ~/.zsh/local.zsh
