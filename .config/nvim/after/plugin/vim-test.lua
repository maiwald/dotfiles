vim.keymap.set("n", "<leader>s", "<cmd> :TestNearest<CR>")
vim.keymap.set("n", "<leader>t", "<cmd> :TestFile<CR>")
vim.keymap.set("n", "<leader>a", "<cmd> :TestSuite<CR>")
vim.keymap.set("n", "<leader>l", "<cmd> :TestLast<CR>")
vim.keymap.set("n", "<leader>g", "<cmd> :TestVisit<CR>")

vim.g['test#strategy'] = "dispatch"
vim.g['test#ruby#use_binstubs'] = 0
