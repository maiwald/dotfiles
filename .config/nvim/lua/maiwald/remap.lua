vim.keymap.set("n", " ", "<nop>")
vim.g.mapleader =  " "

-- disable Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- clear search on ESC ESC
vim.keymap.set("n", "<ESC><ESC>", "<cmd>:nohlsearch<CR>")

-- insert newline above/below
vim.keymap.set("n", "<C-J>", "mao<Esc>`a")
vim.keymap.set("n", "<C-K>", "maO<Esc>`a")

-- move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in front when J-ing lines
vim.keymap.set("n", "J", "mzJ`z")

-- tmux session launcher
vim.keymap.set("n", "<C-f>", "<cmd>:silent ! tmux neww tmux-session-launcher<CR>")

-- more comfortable moving through search results
vim.keymap.set("n", "<leader>n", "<cmd>:cnext<cr>")
vim.keymap.set("n", "<leader>p", "<cmd>:cprevious<cr>")
