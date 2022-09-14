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

    -- Don't leave the visual mode while indenting or outdenting.
    ["<"] = {"<gv"},
    [">"] = {">gv"},
  },
}

M.comment = {
  plugin = true,

  n = {
    ["<leader>ö"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["<leader>ö"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

return M
