local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Normal --
------------
keymap("n", "<ESC>", "<cmd>noh<CR>", opts) -- No highlight
keymap("n", "<C-s>", "<cmd>w<CR>", opts)
-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)
-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)
-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
-- keymap("n", "j", '<expr>v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts)
-- keymap("n", "k", '<expr>v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts)
-- keymap("n", "<Up>", '<expr>v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts)
-- keymap("n", "<Down>", '<expr>v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts)
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)


-- Insert --
------------
keymap("i", "<C-s>", "<cmd>w<CR>", opts)
keymap("i", "<C-b>", "<ESC>^i", opts) -- Move beggining of current line 
keymap("i", "<C-e>", "<End>", opts) -- Move end of current line 
-- Navigate in insert mode
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)


-- Visual --
------------
keymap("v", "<C-s>", "<cmd>w<CR>", opts)
-- keymap("v", "j", '<expr>v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts)
-- keymap("v", "k", '<expr>v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts)
-- keymap("v", "<Up>", '<expr>v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts)
-- keymap("v", "<Down>", '<expr>v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts)
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Visual Block --
------------------
-- keymap("x", "j", '<expr>v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts)
-- keymap("x", "k", '<expr>v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts)
-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
keymap("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', opts)


-- Terminal
local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
keymap("t", "<C-x>", termcodes "<C-\\><C-N>", opts)
