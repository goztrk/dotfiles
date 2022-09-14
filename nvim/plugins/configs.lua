local M = {}

M.treesitter = {
  ensure_installed = {
    "lua",
    "vim",
    "html",
    "css",
    "javascript",
    "json",
    "python",
    "bash",
    "regex",
    "scss",
    "tsx",
    "vue",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    "css-lsp",
    "eslint-lsp",
    "eslint_d",
    "html-lsp",
    "emmet-ls",
    "isort",
    "prettier",
    "pyright",
    "typescript-language-server",
    "json-lsp",
    "mypy",
    "lua-language-server",
    "vetur-vls",
    "vue-language-server",
  },
}

M.indentline = {
  show_current_context = true,
  show_current_context_start = true,
}

M.nvimtree = {
  open_on_setup = true,
  prefer_startup_root = true,
  sync_root_with_cwd = true,
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M

