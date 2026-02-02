return {
    {
        'ggandor/leap.nvim',
        dependencies = { 'tpope/vim-repeat' },
        keys = {
            { 's', '<Plug>(leap-forward)', desc = 'Leap forward', mode = { 'n', 'x', 'o' } },
            { 'S', '<Plug>(leap-backward)', desc = 'Leap backward', mode = { 'n', 'x', 'o' } },
        },
    },
    'AndrewRadev/splitjoin.vim',
    {
        'AndrewRadev/switch.vim',
        init = function()
            vim.g.switch_mapping = '-'
        end,
    },
    'tpope/vim-abolish',
    'tpope/vim-dispatch',
    'tpope/vim-fugitive',
    'tpope/vim-projectionist',
    'tpope/vim-repeat',
    'tpope/vim-surround'
}
