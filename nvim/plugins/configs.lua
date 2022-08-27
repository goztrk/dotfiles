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
    "deno",
    "json-lsp",
    "mypy",
    "lua-language-server",
    "vetur-vls",
    "vue-language-server",
  },
}

return M

