local present, typescript = pcall(require, "typescript")
if not present then
  return
end

local options = {}

options = require("core.utils").load_override(options, "jose-elias-alvarez/typescript")
typescript.setup(options)
