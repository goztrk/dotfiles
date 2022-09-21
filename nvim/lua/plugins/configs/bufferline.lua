local present, bufferline = pcall(require, "bufferline")
if not present then
  return
end

function Toggle_theme()
  local style = require("tokyonight.config").options.style
  if style == "day" then
    require("tokyonight")._load("night")
  else
    require("tokyonight")._load("day")
  end
end

vim.cmd [[
  function Toggle_theme(a,b,c,d)
    lua Toggle_theme()
  endfunction
]]

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
    custom_areas = {
      right = function()
        return {
          { text = "%@Toggle_theme@   %X" },
          -- { text = "%@Quit_vim@ %X" },
        }
      end,
    },
  },
}

options = require("core.utils").load_override(options, "akinsho/bufferline.nvim")
bufferline.setup(options)
