return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["gpanders/editorconfig.nvim"] = {},
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["windwp/nvim-ts-autotag"] = {
    autotag = {
      enable = true,
    },
  },
}
