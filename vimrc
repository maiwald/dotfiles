set nocompatible

" vundle

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/Rename2'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'beyondwords/vim-twig'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mileszs/ack.vim'

filetype plugin indent on
" vundle end

set background=light
colorscheme solarized
syntax on

set number
set numberwidth=4
set ruler
set autoread
set winwidth=90
set splitright

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

" search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" map :W to :w
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" stay the fuck out of insert mode
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" show 2 status lines
set laststatus=2

" get out of insert mode quickly
inoremap kj <Esc>
inoremap Kj <Esc>
inoremap KJ <Esc>

" insert newline above/below
nnoremap <C-J> mao<Esc>`a
nnoremap <C-K> maO<Esc>`a

map <leader>y :wa<cr>:! ./script/yeti spec-js/dev.html<cr>

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
set wildignore+=*/tmp/*,*.scssc,*.sassc,*.class,*.DS_Store
set wildignore+=*/vendor/bundle/*,*/server/*,*/public/system/*,*/node_modules/*,*/.rsync_cache/*
set wildignore+=*theaterjobs*/vendor/*,*/web/bundles/*,*/app/cache/*,*/vendor/bundles*
