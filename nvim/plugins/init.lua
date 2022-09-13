return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["neoclide/coc.nvim"] = {},
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
