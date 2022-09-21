local present, devicons = pcall(require, "nvim-web-devicons")
if not present then
  return
end

local options = {
}

options = require("core.utils").load_override(options, "kyazdani42/nvim-web-devicons")

devicons.setup(options)
