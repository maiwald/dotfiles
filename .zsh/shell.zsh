# prompt
autoload -U colors
colors

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{28}●'
zstyle ':vcs_info:*' unstagedstr '%F{11}●'

precmd() {
    if [[ -n $(git status --porcelain 2>/dev/null | grep '^??') ]]; then
        zstyle ':vcs_info:*' formats ' [%b%c%u%F{red}●%F{clear}]'
    else
        zstyle ':vcs_info:*' formats ' [%b%c%u%F{clear}]'
    fi

    vcs_info
}

setopt prompt_subst
PROMPT='%F{green}%D{%H:%M} %F{yellow}| %F{red}%3~%F{clear}${vcs_info_msg_0_}$ %b'

# List directory on cd
chpwd() {
    ls -lAhG
}

# keybindings
bindkey -e
bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word
bindkey ';3D' emacs-backward-word
bindkey ';3C' emacs-forward-word
bindkey -s ^f " tmux-session-launcher\n"

# shell variables
WORDCHARS=${WORDCHARS:s/-=_//}

# history
export HISTSIZE=20000
export SAVEHIST=100000

# record command duration in history
setopt EXTENDED_HISTORY

# use fcntl locking for safer history writes
setopt HIST_FCNTL_LOCK

# skip duplicates while searching history
setopt HIST_FIND_NO_DUPS

# remove older duplicates when adding new entries
setopt HIST_IGNORE_ALL_DUPS

# ignore consecutive duplicate commands
setopt HIST_IGNORE_DUPS

# ignore commands prefixed with a space
setopt HIST_IGNORE_SPACE

# do not store the history command itself
setopt HIST_NO_STORE

# trim superfluous blanks before saving
setopt HIST_REDUCE_BLANKS

# write via a temporary file, then replace
setopt HIST_SAVE_BY_COPY

# omit older duplicates when writing history
setopt HIST_SAVE_NO_DUPS

# expand history first, then reload into the buffer
setopt HIST_VERIFY

# append history after each command finishes
setopt INC_APPEND_HISTORY_TIME
