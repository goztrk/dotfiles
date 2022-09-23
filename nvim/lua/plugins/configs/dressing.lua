local present, dressing = pcall(require, "dressing")
if not present then
  return
end

local options = {}

options = require("core.utils").load_override(options, "stevearc/dressing.nvim")
dressing.setup(options)
