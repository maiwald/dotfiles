-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'edeneast/nightfox.nvim'

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'ggandor/leap.nvim',
        requires = { { 'tpope/vim-repeat' } }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/playground'

    use 'nvim-lualine/lualine.nvim'
    use {
        'airblade/vim-gitgutter',
        branch = 'main'
    }

    use 'nvim-tree/nvim-tree.lua'

    use 'neovim/nvim-lspconfig'
    use { 'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip'
        }
    }

    use 'dense-analysis/ale'
    use 'vim-test/vim-test'

    use 'AndrewRadev/splitjoin.vim'
    use 'AndrewRadev/switch.vim'
    use 'tpope/vim-abolish'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-projectionist'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'

    use {
        'kristijanhusak/vim-dadbod-ui',
        requires = {
            { 'tpope/vim-dadbod' },
        },
    }
end)
