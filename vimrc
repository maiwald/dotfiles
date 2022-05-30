set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'altercation/vim-colors-solarized'
Plug 'dense-analysis/ale'
Plug 'eraserhd/parinfer-rust', { 'do': 'cargo build --release' }
Plug 'fishbullet/deoplete-ruby'
Plug 'godlygeek/tabular'
Plug 'ianks/vim-tsx'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'neovim/nvim-lspconfig'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-abolish'
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/Rename2'

call plug#end()

syntax enable
filetype plugin indent on
set background=light
colorscheme solarized

" airline
let g:airline_powerline_fonts = 1
let g:airline_section_b = ''

set foldcolumn=2
set nonumber
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

" custom indentation
autocmd FileType php setlocal shiftwidth=4 softtabstop=4 cindent
autocmd FileType twig setlocal shiftwidth=4 softtabstop=4
autocmd FileType java setlocal shiftwidth=4 softtabstop=4
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=0
autocmd FileType gomod setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=0

" language servers
lua << EOF
require'lspconfig'.clojure_lsp.setup{}
require'lspconfig'.gopls.setup{}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clojure_lsp', 'gopls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

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
autocmd BufWritePre * if (index(['markdown', 'yaml'], &ft) < 0) | :%s/\s\+$//e

let maplocalleader = ","
let mapleader = ","

" fzf
nnoremap <c-p> :FZF<CR>
nnoremap <silent> <leader>b :Buffers<CR>

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

" enable mouse
set mouse=a

" display whitespace and tabs
set list
set listchars=tab:▸\ ,trail:·,nbsp:·
:highlight MyTabSpace ctermfg=grey
:match MyTabSpace /\t\| /

" cursor
set cursorline
set guicursor=n-v-c:block,i-ci:ver100,r-o-cr:hor100

" cd folder preview
set wildmenu
set wildmode=list:longest

" disable Ex mode
nnoremap Q <NOP>

" search
set hlsearch " highlight search and when typing
set ignorecase " case insensitive search
set smartcase

" s/ preview
set inccommand=split

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

" open Ggrep in quickfix window
autocmd QuickFixCmdPost *grep* cwindow

" stay the fuck out of insert mode
" inoremap <Left> <NOP>
" inoremap <Right> <NOP>
" inoremap <Up> <NOP>
" inoremap <Down> <NOP>

" move up and down displayed lines
noremap j gj
noremap k gk
noremap <up> g<up>
noremap <down> g<down>

" show 2 status lines
set laststatus=2

" insert newline above/below
nnoremap <C-J> mao<Esc>`a
nnoremap <C-K> maO<Esc>`a

" more comfortable moving through search results
nnoremap <leader>n :cnext<cr>
nnoremap <leader>p :cprevious<cr>

" switch mapping
let g:switch_mapping = "-"

set wildignore+=*/tmp/*,*.scssc,*.sassc,*.class,*.DS_Store
set wildignore+=*/vendor/bundle/*,*/server/*,*/public/system/*,*/node_modules/*,*/.rsync_cache/*
set wildignore+=*/public/javascripts/compiled/*,*/app-js/vendor/*

" enable jsx highlighting on js files
let g:jsx_ext_required = 0

" save before calling make (tests)
set autowrite

" enable deoplete
let g:deoplete#enable_at_startup = 1

" configure ALE for linting
let g:ale_linters = {
      \ 'clojure': ['clj-kondo'],
      \ 'javascript': ['eslint'],
      \ 'typescriptreact': ['tsserver', 'eslint'],
      \}

let g:ale_fixers = {
      \ 'go': ['gofmt'],
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'css': ['prettier'],
      \ 'scss': ['prettier']
      \}

let g:ale_fix_on_save = 1
