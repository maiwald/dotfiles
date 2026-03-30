return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local lga_actions = require("telescope-live-grep-args.actions")
            telescope.setup({
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
                extensions = {
                    live_grep_args = {
                        auto_quoting = true, -- enable/disable auto-quoting
                        -- define mappings, e.g.
                        mappings = {     -- extend mappings
                            i = {
                                ["<C-k>"] = lga_actions.quote_prompt(),
                                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                                -- freeze the current list and start a fuzzy search in the frozen list
                                ["<C-space>"] = lga_actions.to_fuzzy_refine,
                            },
                        },
                    },
                },
            })
            telescope.load_extension("live_grep_args")
        end,
        keys = {
            { "<C-p>",      "<cmd>Telescope git_files<cr>",  desc = "Telescope git_files" },
            { "<leader>b",  "<cmd>Telescope buffers<cr>",    desc = "Telescope buffers" },
            {
                "<leader>fg",
                function()
                    require("telescope").extensions.live_grep_args.live_grep_args()
                end,
                desc = "Telescope live_grep",
            },
            { "<leader>fp", "<cmd>Telescope find_files<cr>", desc = "Telescope find_files" },
            { "<leader>fs", "<cmd>Telescope git_status<cr>", desc = "Telescope git_status" },
        },

    }
}
