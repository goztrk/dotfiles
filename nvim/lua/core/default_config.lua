-- Chadrc overrides this file

local M = {}

M.options = {
  nvChad = {
    update_url = "https://github.com/NvChad/NvChad",
    update_branch = "main",
  },
}

M.plugins = {}

-- check core.mappings for table structure
M.mappings = require "core.mappings"

return M
