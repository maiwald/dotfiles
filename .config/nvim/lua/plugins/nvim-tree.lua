return {
    {
        'nvim-tree/nvim-tree.lua',
        opts = {
            diagnostics = {
                enable = true,
            },
            view = {
                width = 36,
            },
            renderer = {
                icons = {
                    git_placement = "after",
                    show = {
                        file = false,
                        folder = false,
                        git = true,
                        folder_arrow = true,
                    }
                }
            }
        },
        cmd = {
            'NvimTreeToggle',
            'NvimTreeFindFile',
        },
        keys = {
            { "<C-n>", "<cmd>:NvimTreeToggle<CR>", desc = "NvimTreeToggle" },
            { "<leader>gf", "<cmd>:NvimTreeFindFile<CR>", desc = "NvimTreeFindFile" },
        },
    }
}
