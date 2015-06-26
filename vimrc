set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'adimit/prolog.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'godlygeek/tabular'
Plug 'jimenezrick/vimerl'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'kchmck/vim-coffee-script'
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'mileszs/ack.vim'
Plug 'mtscout6/vim-cjsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/Rename2'

call plug#end()

set background=light
colorscheme solarized
syntax on

" airline
let g:airline_powerline_fonts = 1
let g:airline_section_b = ''

set number
set numberwidth=4
set ruler
set autoread
set winwidth=90
set splitright
set splitbelow

" indentation
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" allow backspace to delete indentation
set backspace=indent,eol,start

" allow hiding modified buffers
set hidden

" no backup or swapping
set nobackup
set nowritebackup
set noswapfile

" persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" custom indentation
autocmd FileType php setlocal shiftwidth=4 softtabstop=4 cindent
autocmd FileType twig setlocal shiftwidth=4 softtabstop=4
autocmd FileType java setlocal shiftwidth=4 softtabstop=4

let maplocalleader = ","
let mapleader = ","

" fzf
nnoremap <c-p> :FZF<CR>
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" comment
map <D-7> ,c<space>

" display whitespace
set list
set listchars=tab:▸\ ,trail:·,nbsp:·

set cursorline

" cd folder preview
set wildmenu
set wildmode=list:longest

" disable Ex mode
nnoremap Q <NOP>

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

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

nnoremap <space> zz

" map NERDTree
map <C-n> :NERDTreeToggle<CR>

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"

" map :W to :w
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" stay the fuck out of insert mode
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" move up and down displayed lines
noremap j gj
noremap k gk

" show 2 status lines
set laststatus=2

" get out of insert mode quickly
inoremap kj <Esc>
inoremap Kj <Esc>
inoremap KJ <Esc>

" insert newline above/below
nnoremap <C-J> mao<Esc>`a
nnoremap <C-K> maO<Esc>`a

" more comfortable moving through search results
nnoremap <leader>n :cnext<cr>
nnoremap <leader>p :cprevious<cr>

function! TabularizeRuby()
  call feedkeys(":Tab /,\<CR>")
  call feedkeys(":Tab /[\<CR>")
  call feedkeys(":Tab /]\<CR>")
endfunction
map <leader>T :call TabularizeRuby()<CR>

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

set wildignore+=*/tmp/*,*.scssc,*.sassc,*.class,*.DS_Store
set wildignore+=*/vendor/bundle/*,*/server/*,*/public/system/*,*/node_modules/*,*/.rsync_cache/*
set wildignore+=*/public/javascripts/compiled/*,*/app-js/vendor/*
