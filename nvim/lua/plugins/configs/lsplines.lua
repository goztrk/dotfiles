local present, lsplines = pcall(require, "lsp_lines")
if not present then
  return
end

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})

local options = {}

options = require("core.utils").load_override(options, "https://git.sr.ht/~whynothugo/lsp_lines.nvim")
lsplines.setup(options)
