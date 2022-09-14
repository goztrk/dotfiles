local autocmd = vim.api.nvim_create_autocmd

-- Open in entered working directory
autocmd("VimEnter", {
  pattern = "*",
  command = "silent! cd %:p:h",
})

-- Fix the files with eslint upon saving
autocmd("BufWritePre", {
  pattern = "*.tsx,*.ts,*.jsx,*.js",
  command = "EslintFixAll"
})
