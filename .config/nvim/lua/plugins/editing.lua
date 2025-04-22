return {
    {
        'ggandor/leap.nvim',
        dependencies = { 'tpope/vim-repeat' },
        init = function()
            require('leap').add_default_mappings()
        end,

    },
    'AndrewRadev/splitjoin.vim',
    'AndrewRadev/switch.vim',
    'tpope/vim-abolish',
    'tpope/vim-dispatch',
    'tpope/vim-fugitive',
    'tpope/vim-projectionist',
    'tpope/vim-repeat',
    'tpope/vim-surround'
}
