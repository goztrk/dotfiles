local present, bufferline = pcall(require, "bufferline")
if not present then
  return
end

vim.opt.termguicolors = true
local options = {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = function()
          return vim.fn.getcwd()
        end,
        text_align = "left",
        highlight = "Directory",
        separator = true,
      },
    },
  },
}

options = require("core.utils").load_override(options, "akinsho/bufferline.nvim")
bufferline.setup(options)
