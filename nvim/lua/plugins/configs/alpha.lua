local present, alpha = pcall(require, "alpha")
if not present then
  return
end

local dashboard = require "alpha.themes.dashboard"

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "Macro"
  return b
end

dashboard.section.header.val = {
  [[                                                ]],
  [[  ______  _____  ______   __    _____   __  __  ]],
  [[ |   ___|/     \|___   |_|  |_ |     | |  |/ /  ]],
  [[ |   |  ||     | .-`.-`|_    _||     \ |     \  ]],
  [[ |______|\_____/|______| |__|  |__|\__\|__|\__\ ]],
  [[                                                ]],
  [[                                                ]],
}

dashboard.section.buttons.val = {
  button("f", "  Find File",   ":Telescope find_files<CR>"),
  button("r", "  Recent File", ":Telescope oldfiles<CR>"),
  button("w", "  Find Word",   ":Telescope live_grep<CR>"),
  button("b", "  Bookmarks",   ":Telescope marks<CR>"),
  button("c", "  Config",      ":e ~/.config/nvim/init.lua | :cd %:p:h <CR>"),
  button("u", "痢 Update",      ":PackerSync<CR>"),
  button("q", "  Close",       ":qa<CR>"),
}

local function footer()
  return "github.com/goztrk/dotfiles"
end
dashboard.section.footer.val = footer()


dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Macro"
dashboard.section.footer.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
