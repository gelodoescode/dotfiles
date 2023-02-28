local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- tab space
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- line number
vim.wo.wrap = false
vim.wo.number = true
vim.wo.relativenumber = true

-- window's width resize
keymap("n", "=", "[[<cmd>vertical resize +5<cr>]]", opts)
keymap("n", "-", "[[<cmd>vertical resize -5<cr>]]", opts)

-- window's height resize
keymap("n", "_", "[[<cmd>horizontal resize -3<cr>]]", opts)
keymap("n", "+", "[[<cmd>horizontal resize +3<cr>]]", opts)


