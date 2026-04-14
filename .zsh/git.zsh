# git aliases
alias ga='git add -A'
alias gap='git add -A -p'
alias gb='git b'
alias gbd='git branch -d $(git branch | fzf)'
alias gci='git commit'
alias gco='git checkout'
alias gcof='git checkout $(git branch | fzf)'
alias gd='git diff --find-copies'
alias gds='git diff --staged --find-copies'
alias gg='git g -n 20 | tail -n 100'
alias gp='git pull --rebase --autostash'
alias gpp='git pull --rebase --autostash && git push'
alias grc='git rebase --continue'
alias gst='git status'

gm() {
    git rev-parse --verify main &> /dev/null
    if [ $? -eq 0 ]; then
        git checkout main
    else
        git checkout master
    fi
}

gri() {
    local BRANCH
    if [ $# -eq 1 ]; then
        BRANCH=$1
    else
        git rev-parse --verify main &> /dev/null
        if [ $? -eq 0 ]; then
            BRANCH=origin/main
        else
            BRANCH=origin/master
        fi
    fi
    git rebase --interactive --autostash --autosquash $BRANCH
}

gcif() {
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [ $current_branch = "master" ] || [ $current_branch = "main" ]; then
        commit=$(git log -n 20 --oneline --decorate | fzf | cut -d " " -f 1)
    else
        git rev-parse --verify main &> /dev/null
        if [ $? -eq 0 ]; then
            commit=$(git log origin/main..HEAD --oneline --decorate | fzf | cut -d " " -f 1)
        else
            commit=$(git log origin/master..HEAD --oneline --decorate | fzf | cut -d " " -f 1)
        fi
    fi

    gci --fixup $commit
}

ghc() {
    if [ $# -eq 1 ]; then
        git clone git@github.com:"$1".git
    fi
}

gru() {
    read "reply?Reset to upstream, are you sure? [y/N]"
    if [[ "$reply" =~ ^[Yy]$ ]]; then
        git fetch && git reset --hard @{u}
    fi
}
