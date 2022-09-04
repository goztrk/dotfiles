local M = {}

M.gokhan = {
  i = {
    -- Save
    ["<C-s>"] = { "<cmd> w <CR>", "save file" },
  },
  n = {
    -- Turkish character mappings
    ["ğ"] = {"["},
    ["Ğ"] = {"{"},
    ["ü"] = {"]"},
    ["Ü"] = {"}"},
    ["ı"] = {"i"},
    ["ş"] = {"/"},

    -- git
    ["<leader>ga"] = {"<cmd> :!git add % <CR>", "GIT: stage current file"},
  },
  v = {
    -- Turkish character mappings
    ["ğ"] = {"["},
    ["Ğ"] = {"{"},
    ["ü"] = {"]"},
    ["Ü"] = {"}"},
    ["ı"] = {"i"},
    ["ş"] = {"/"},
  },
}

return M
