alias please='sudo'

# neovim
alias vim='nvim'
alias vi='nvim'

# ls
alias ls='ls -G'
alias la='ls -lAh'

# ruby
alias b='bundle exec'
alias be='b'
alias RAT='RAILS_ENV=test RACK_ENV=test'

# brew
alias brupdate='brew update && brew outdated'
alias brupgrade='brew upgrade && brew cleanup'

if ! [ -x "$(command -v pbcopy)" ]; then
    alias pbcopy='xsel -bi'
    alias pbpaste='xsel -bo'
fi

mk() {
    if [ $# -eq 1 ]; then
        mkdir $1 && cd $1
    fi
}
