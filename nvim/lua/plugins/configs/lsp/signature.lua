local present, signature = pcall(require, "lsp_signature")
if not present then
  return
end

local options = {
  doc_lines = 0,
  floating_window = false,
  floating_window_above_cur_line = true,
  hint_prefix = " ",
  hint_scheme = "String",
}

options = require("core.utils").load_override(options, "ray-x/lsp_signature.nvim")

signature.setup(options)
signature.on_attach(options)
