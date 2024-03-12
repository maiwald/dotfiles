require("nvim-tree").setup({
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
})

vim.keymap.set("n", "<C-n>", "<cmd>:NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>gf", "<cmd>:NvimTreeFindFile<CR>")
