local present, surround = pcall(require, "nvim-surround")
if not present then
  return
end

local options = {
}

options = require("core.utils").load_override(options, "kylechui/nvim-surround")
surround.setup(options)

vim.cmd[[nmap <leader>' siw']]
