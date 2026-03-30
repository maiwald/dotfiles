return {
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            'tpope/vim-dadbod',
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
        },
        keys = {
            { '<leader>d', '<cmd>:tab DBUI<CR>', desc = 'Open DBUI' },
        },
    }
}
