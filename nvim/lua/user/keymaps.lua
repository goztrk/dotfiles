M = {}
local opts = { noremap = true, silent = true }

local termOpts = { silent = true }

-- Shorten function name
keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- INSERT MODE --
-- Go to beggining and end
keymap("i", "<C-b>", "<ESC>^i", opts)
keymap("i", "<C-e>", "<End>", opts)

-- Navigate within insert mode
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)


-- NORMAL MODE --
keymap("n", "<C-s>", ":w<CR>", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
-- keymap("", "", "", opts)
