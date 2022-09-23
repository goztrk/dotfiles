local present, mason_lspconfig = pcall(require, "mason-lspconfig")
if not present then
  return
end

local servers = vim.tbl_keys(require("plugins.configs.lsp.servers"))

local options = {
  ensure_installed = servers,
  automatic_installation = true,
}

options = require("core.utils").load_override(options, "williamboman/mason-lspconfig.nvim")

vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
end, {})

mason_lspconfig.setup(options)
