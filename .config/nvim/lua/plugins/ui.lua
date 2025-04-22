return {
    {
        'edeneast/nightfox.nvim',
        init = function()
            vim.o.background = "dark"
            vim.cmd.colorscheme("nightfox")
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {},
                always_divide_middle = true,
                globalstatus = false,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {},
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = { 'filetype', 'encoding' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = {}
        }
    },
    {
        'airblade/vim-gitgutter',
        lazy = false,
        branch = 'main',
        keys = {
            { "<leader>ga", "<cmd>GitGutterStageHunk<CR>", desc = "GitGutterStageHunk" },
            { "<leader>gu", "<cmd>GitGutterUndoHunk<CR>",  desc = "GitGutterUndoHunk" },
        }
    }
}
