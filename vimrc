set nocompatible

" vundle

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'kien/ctrlp.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Lokaltog/vim-powerline'
Bundle 'beyondwords/vim-twig'
Bundle 'wgibbs/vim-irblack'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on
" vundle end

set background=light
colorscheme solarized
syntax on

set number
set numberwidth=4
set ruler
set autoread

" indentation
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" allow hiding modified buffers
set hidden

" no backup or swapping
set nobackup
set nowritebackup
set noswapfile

" load clojure nailgun
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = "/usr/local/Cellar/nailgun/0.7.1/bin/ng"

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" custom indentation
autocmd FileType php setlocal shiftwidth=4 softtabstop=4 cindent
autocmd FileType twig setlocal shiftwidth=4 softtabstop=4
autocmd FileType java setlocal shiftwidth=4 softtabstop=4

nmap <space> zz
let maplocalleader = ","
let mapleader = ","

" controlP
let g:ctrlp_map = '<c-p>'
nmap  :CtrlPBuffer<cr>
let g:ctrlp_working_path_mode = 0

" comment
map <D-7> ,c<space>

" display whitespace
set list
set listchars=tab:▸\ ,trail:·,nbsp:·

set cursorline

" cd folder preview
set wildmenu
set wildmode=list:longest

" search
set hlsearch " highlight search and when typing
set ignorecase " case insensitive search
set smartcase

" stay the fuck out of insert mode
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" show 2 status lines
set laststatus=2

" get out of insert mode quickly
inoremap kj <Esc>

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
set wildignore+=*/tmp/*,*.scssc,*.sassc,*.class,*.DS_Store
set wildignore+=*/vendor/bundle/*,*/server/*,*/public/system/*
set wildignore+=*theaterjobs*/vendor/*,*/web/bundles/*,*/app/cache/*,*/vendor/bundles*
