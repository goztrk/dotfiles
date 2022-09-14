return {
  ["vim-scripts/argtextobj.vim"] = {},
  ["ggandor/leap.nvim"] = {},
  ["neoclide/coc.nvim"] = {},
  ["gpanders/editorconfig.nvim"] = {},
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["windwp/nvim-ts-autotag"] = {
    autotag = {
      enable = true,
    },
  },
}
