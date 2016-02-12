set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'adimit/prolog.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
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
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-salve'
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
function! s:buffer_list()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:buffer_handler(lines) abort
  if empty(a:lines)
    return
  endif
  let cmd = get({ 'ctrl-t': 'tabedit | b',
                \ 'ctrl-x': 'split | b',
                \ 'ctrl-v': 'vsplit | b' }, remove(a:lines, 0), 'b')
  execute cmd.matchstr(a:lines[0], '^[ 0-9]*')
endfunction

" rails.vim alternate files
let g:rails_projections = {
\   "app-js/*.coffee": {
\     "alternate": "spec-js/%s_spec.coffee"
\   },
\   "spec-js/*_spec.coffee": {
\     "alternate": "app-js/%s.coffee"
\   },
\   "import/*.rb": {
\     "alternate": "spec_import/%s_spec.rb"
\   },
\   "spec_import/*_spec.rb": {
\     "alternate": "import/%s.rb"
\   }
\ }

nnoremap <silent> <leader>b :call fzf#run({
  \ 'source':  <sid>buffer_list(),
  \ 'options': '--expect=ctrl-t,ctrl-x,ctrl-v',
  \ 'down':    len(<sid>buffer_list()) + 2,
  \ 'sink*':   function('<sid>buffer_handler')})<cr>

" comment
map <D-7> ,c<space>

" display whitespace
set list
set listchars=tab:▸\ ,trail:·,nbsp:·

" cursor
set cursorline
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

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

" clear search on ESC ESC
map <ESC><ESC> :nohlsearch<CR>

" map NERDTree
map <C-n> :NERDTreeToggle<CR>

" test.vim mappings
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let g:test#strategy = 'dispatch'

autocmd FileType ruby
  \ if expand('%') =~# '_test\.rb$' |
  \   compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
  \ elseif expand('%') =~# '_spec\.rb$' |
  \   compiler rspec | setl makeprg=rspec\ \"%:p\" |
  \ else |
  \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
  \ endif

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

" switch mapping
let g:switch_mapping = "-"

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

" save before calling make (tests)
set autowrite
