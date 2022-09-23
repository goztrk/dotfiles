-- set to true for servers that have configs
return {
  cssls = { type = "lsp", has_setting = false },
  cssmodules_ls = { type = "lsp", has_setting = false },
  emmet_ls = { type = "lsp", has_setting = true },
  eslint = { type = "lsp", has_setting = false },
  html = { type = "lsp", has_setting = false },
  jsonls = { type = "lsp", has_setting = false },
  ["lua-language-server"] = { type = "lsp2", has_setting = false },
  sumneko_lua = { type = "lsp", has_setting = true },
  tsserver = { type = "lsp", has_setting = true },
  pyright = { type = "lsp", has_setting = true },
  black = { type = "formatter", has_setting = false },
  flake8 = { type = "linter", has_setting = false },
  bashls = { type = "lsp", has_setting = false },
}
