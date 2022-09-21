local plugins = {

  ["nvim-lua/plenary.nvim"] = { module = "plenary" },

  ["lewis6991/impatient.nvim"] = {},

  ["wbthomason/packer.nvim"] = {
    cmd = require("core.lazy_load").packer_cmds,
    config = function()
      require "plugins"
    end,
  },

  ["nvim-lua/popup.nvim"] = {},

  -- For plugin development of neovim
  ["christianChiarulli/lua-dev.nvim"] = {},

  ["williamboman/mason.nvim"] = {
    config = function()
      require "plugins.configs.lsp.mason"
    end,
  },

  ["williamboman/mason-lspconfig.nvim"] = {
    config = function()
      require "plugins.configs.lsp.mason-lspconfig"
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lsp.lspconfig"
    end,
  },

  ["ray-x/lsp_signature.nvim"] = {
    config = function()
      require "plugins.configs.lsp.signature"
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function()
      require "plugins.configs.lsp.null-ls"
    end,
  },

  ["rafamadriz/friendly-snippets"] = {
    module = { "cmp", "cmp_nvim_lsp" },
    event = "InsertEnter",
  },

  ["hrsh7th/nvim-cmp"] = {
    after = "friendly-snippets",
    config = function()
      require "plugins.configs.cmp"
    end,
  },

  ["L3MON4D3/LuaSnip"] = {
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require "plugins.configs.luasnip"
    end,
  },

  ["saadparwaiz1/cmp_luasnip"] = { after = "LuaSnip" },
  ["hrsh7th/cmp-nvim-lua"] = { after = "cmp_luasnip" },
  ["hrsh7th/cmp-nvim-lsp"] = { after = "cmp-nvim-lua" },
  ["hrsh7th/cmp-buffer"] = { after = "cmp-nvim-lsp" },
  ["hrsh7th/cmp-path"] = { after = "cmp-buffer" },

  ["kyazdani42/nvim-web-devicons"] = {
    config = function()
      require "plugins.configs.devicons"
    end,
  },

  ["folke/tokyonight.nvim"] = {
    config = function()
      require "plugins.configs.tokyonight"
    end,
  },

  ["lewis6991/gitsigns.nvim"] = {
    config = function()
      require("plugins.configs.others").gitsigns()
    end,
  },

  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
      require "plugins.configs.alpha"
    end,
  },

  ["numToStr/Comment.nvim"] = {
    module = "Comment",
    keys = { "gc", "gb" },
    config = function()
      require "plugins.configs.comment"
    end,
    setup = function()
      require("core.utils").load_mappings "comment"
    end,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require "plugins.configs.nvimtree"
    end,
    setup = function()
      require("core.utils").load_mappings "nvimtree"
    end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    config = function()
      require "plugins.configs.telescope"
    end,
    setup = function()
      require("core.utils").load_mappings "telescope"
    end,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    module = "nvim-treesitter",
    setup = function()
      require("core.lazy_load").on_file_open "nvim-treesitter"
    end,
    cmd = require("core.lazy_load").treesitter_cmds,
    config = function()
      require "plugins.configs.treesitter"
    end,
    run = ":TSUpdate",
  },

  ["famiu/bufdelete.nvim"] = {
    setup = function()
      require("core.utils").load_mappings "bufdelete"
    end,
  },

  ["akinsho/bufferline.nvim"] = {
    config = function()
      require "plugins.configs.bufferline"
    end,
    setup = function()
      require("core.utils").load_mappings "bufferline"
    end,
  },

  ["christianchiarulli/lualine.nvim"] = {
    config = function()
      require "plugins.configs.lualine"
    end,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    config = function()
      require "plugins.configs.blankline"
    end,
    setup = function()
      require("core.utils").load_mappings "blankline"
    end,
  },

  ["windwp/nvim-autopairs"] = {
    config = function()
      require "plugins.configs.autopairs"
    end,
  },

  ["akinsho/toggleterm.nvim"] = {
    config = function()
      require "plugins.configs.toggleterm"
    end,
  },

  -- Only load whichkey after all the gui
  ["folke/which-key.nvim"] = {
    disable = false,
    module = "which-key",
    keys = { "<leader>", '"', "'", "`" },
    config = function()
      require "plugins.configs.whichkey"
    end,
    setup = function()
      require("core.utils").load_mappings "whichkey"
    end,
  },
}

-- Load all plugins
local present, packer = pcall(require, "packer")

if present then
  vim.cmd "packadd packer.nvim"

  -- Override with default plugins with user ones
  plugins = require("core.utils").merge_plugins(plugins)

  -- load packer init options
  local init_options = require("plugins.configs.others").packer_init()
  init_options = require("core.utils").load_override(init_options, "wbthomason/packer.nvim")
  packer.init(init_options)

  for _, v in pairs(plugins) do
    packer.use(v)
  end
end
