local actions = require("telescope.actions")

return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
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
        },
        keys = {
            { "<C-p>",      "<cmd>Telescope git_files<cr>",  desc = "Telescope git_files" },
            { "<leader>b",  "<cmd>Telescope buffers<cr>",    desc = "Telescope buffers" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Telescope live_grep" },
            { "<leader>fp", "<cmd>Telescope find_files<cr>", desc = "Telescope find_files" },
            { "<leader>fs", "<cmd>Telescope git_status<cr>", desc = "Telescope git_status" },
        },

    }
}
