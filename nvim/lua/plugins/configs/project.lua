local present, project = pcall(require, "project_nvim")
if not present then
  return
end

local options = {}

options = require("core.utils").load_override(options, "ahmedkhalf/project.nvim")
project.setup(options)
