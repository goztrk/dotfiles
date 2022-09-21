local present, mason_lspconfig = pcall(require, "mason-lspconfig")
if not present then
  return
end

local options = {
  ensure_installed = {
    "cssls",
    "cssmodules_ls",
    "emmet_ls",
    "html",
    "jsonls",
    "sumneko_lua",
    "tsserver",
    "pyright",
    "bashls",
  },
  automatic_installation = true,
}

options = require("core.utils").load_override(options, "williamboman/mason-lspconfig.nvim")

vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
end, {})

mason_lspconfig.setup(options)
