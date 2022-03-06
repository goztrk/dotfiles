local map = require("core.utils").map

-- Turkish characters
map("n", "ğ", "[")
map("n", "Ğ", "{")
map("n", "ü", "]")
map("n", "Ü", "}")
map("n", "ı", "i")

-- Save
map("i", "<C-s>", "<C-O>:update<cr>")

-- Quit
map("i", "<C-Q>", "<esc>:q<cr>")
map("n", "<C-Q>", ":q<cr>")
map("v", "<C-Q>", "<esc>")
