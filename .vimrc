set nocompatible

call plug#begin('~/.vim/plugged')

Plug '/opt/homebrew/opt/fzf'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'dense-analysis/ale'
Plug 'edeneast/nightfox.nvim'
Plug 'godlygeek/tabular'
Plug 'guns/vim-sexp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'ianks/vim-tsx'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'mxw/vim-jsx'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/Rename2'

call plug#end()

syntax enable
filetype plugin indent on

if (has("termguicolors"))
 set termguicolors
endif

set background=light
colorscheme dayfox

lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'filetype', 'encoding'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF

set foldcolumn=2
set number
set relativenumber
set scrolloff=2
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

set completeopt=menu,menuone,noselect

" nvim cmp
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { "i","c" } ),
      ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { "i","c" } ),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })
EOF

" language servers
lua << EOF
require'lspconfig'.clojure_lsp.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.solargraph.setup{
  settings = {
    solargraph = {
      autoformat = false,
    }
  }
}

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
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clojure_lsp', 'gopls', 'solargraph' }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" mouse bindings for code exploration
nnoremap <silent> <2-LeftMouse> <LeftMouse><cmd>lua vim.lsp.buf.definition()<CR>zz
nnoremap <silent> <c-RightMouse> <LeftMouse><c-o>zz

" tree sitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "vim", "go", "clojure", "javascript", "html", "scss", "ruby"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  textobjects = { enable = false },
  incremental_selection = { enable = false },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    -- adiitional_vim_regex_highlighting = false,
  },
}
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

nnoremap <c-p> <cmd>Files<CR>
nnoremap <silent> <leader>b <cmd>Buffers<CR>

let g:projectionist_heuristics = {
\   '*.go': {
\     '*.go': {'alternate': '{}_test.go', 'type': 'source'},
\     '*_test.go': {'alternate': '{}.go', 'type': 'test'},
\   }
\ }

" enable mouse
set mouse=a

" display whitespace and tabs
set list
set listchars=tab:▸\ ,trail:·,nbsp:·

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

" clear search on ESC ESC
map <ESC><ESC> :nohlsearch<CR>

" map NERDTree
let g:NERDTreeMinimalMenu=1
map <C-n> :NERDTreeToggle<CR>

" test.vim mappings
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let g:test#strategy = 'dispatch'

" tmux session launcher
nnoremap <silent> <C-f> :silent ! tmux neww tmux-session-launcher<CR>

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

" configure ALE for linting
let g:ale_linters = {
      \ 'clojure': ['clj-kondo'],
      \ 'go': ['gopls', 'golangci-lint'],
      \ 'javascript': ['eslint'],
      \ 'typescriptreact': ['tsserver', 'eslint']
      \}

let g:ale_fixers = {
      \ 'css': ['prettier'],
      \ 'go': ['goimports', 'gofmt'],
      \ 'javascript': ['prettier'],
      \ 'ruby': ['rubocop'],
      \ 'scss': ['prettier'],
      \ 'typescript': ['prettier']
      \}

let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_go_golangci_lint_package = 1
