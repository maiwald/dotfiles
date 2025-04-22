vim.g.dbs = {}
vim.api.nvim_exec([[ autocmd FileType dbout setlocal nofoldenable ]], false)
vim.keymap.set("n", "<leader>d", ":DBUIToggle<CR>", { noremap = true, silent = true })
