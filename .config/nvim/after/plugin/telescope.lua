local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
    pickers = {
        buffers = {
            ignore_current_buffer = true,
            sort_mru = true,
            mappings = {
                i = {
                    ["<C-d>"] = actions.delete_buffer,
                },
            },
        },
    },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fp', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.git_status, {})
