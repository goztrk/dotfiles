local present, lspconfig = pcall(require, "lspconfig")
if not present then
  return
end

local servers = require "plugins.configs.lsp.servers"
for server, options in pairs(servers) do
  local opts = {
    on_attach = require("plugins.configs.lsp.handlers").on_attach,
    capabilities = require("plugins.configs.lsp.handlers").capabilities,
  }

  if options.type == "lsp" then
    if options.has_setting then
      lspconfig[server].setup(require("core.utils").load_lsp_settings(opts, server))
    else
      lspconfig[server].setup(opts)
    end
  end
end
