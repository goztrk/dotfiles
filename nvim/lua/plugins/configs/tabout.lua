local present, tabout = pcall(require, "tabout")
if not present then
  return
end

local options = {}

options = require("core.utils").load_override(options, "abecodes/tabout.nvim")
tabout.setup(options)
