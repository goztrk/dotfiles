local present, lualine = pcall(require, "lualine")
if not present then
  return
end

local M = {}
local colors = require("tokyonight.colors").setup({ transform = true })

-- check if value in table
local function contains(t, value)
  for _, v in pairs(t) do
    if v == value then
      return true

    end
  end
  return false
end

local gray = colors.gray
local red = colors.red
local blue = colors.blue
local green = colors.green
local cyan = colors.cyan
local orange = colors.orange
local indent = colors.indent
local purple = colors.purple

vim.api.nvim_set_hl(0, "SLGitIcon", { fg = colors.orange, bg = colors.fg_gutter })
vim.api.nvim_set_hl(0, "SLTermIcon", { fg = purple, bg = gray })
vim.api.nvim_set_hl(0, "SLBranchName", { fg = "#abb2bf", bg = colors.fg_gutter, bold = false })
vim.api.nvim_set_hl(0, "SLProgress", { fg = purple, bg = colors.fg_gutter })
vim.api.nvim_set_hl(0, "SLLocation", { fg = blue, bg = colors.fg_gutter })
vim.api.nvim_set_hl(0, "SLFT", { fg = cyan, bg = colors.fg_gutter })
vim.api.nvim_set_hl(0, "SLIndent", { fg = indent, bg = colors.fg_gutter })
vim.api.nvim_set_hl(0, "SLLSP", { fg = "#6b727f", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLSep", { fg = colors.fg_gutter, bg = "NONE" })
vim.api.nvim_set_hl(0, "SLFG", { fg = "#abb2bf", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLSeparator", { fg = "#6b727f", bg = "NONE", italic = true })
vim.api.nvim_set_hl(0, "SLError", { fg = "#bf616a", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLWarning", { fg = "#D7BA7D", bg = "NONE" })
vim.api.nvim_set_hl(0, "SLCopilot", { fg = "#6CC644", bg = "NONE" })

local hl_str = function(str, hl)
  return "%#" .. hl .. "#" .. str .. "%*"
end

local mode_color = {
  n = colors.fg_gutter,
  i = colors.green,
  v = colors.magenta,
  [""] = "#b668cd",
  V = "#b668cd",
  -- c = '#B5CEA8',
  -- c = '#D7BA7D',
  c = "#46a6b2",
  no = "#D16D9E",
  s = green,
  S = orange,
  [""] = orange,
  ic = red,
  R = "#D16D9E",
  Rv = red,
  cv = blue,
  ce = blue,
  r = red,
  rm = "#46a6b2",

  ["r?"] = "#46a6b2",
  ["!"] = "#46a6b2",
  t = red,
}

-- local left_pad = {
--   function()
--     return " "
--   end,
--   padding = 0,
--   color = function()
--     return { fg = colors.fg_gutter, bg = "none" }
--   end,
-- }
--
local right_pad = {
  function()
    return " "
  end,
  padding = 0,
  color = function()
    return { fg = colors.fg_gutter, bg = "none" }
  end,
}

local left_pad_mode = {
  function()
    return " "
  end,
  padding = 0,
  color = function()
    return { fg = mode_color[vim.fn.mode()], bg = "none" }
  end,
}

-- local right_pad_mode = {
--   function()
--     return " "
--   end,
--   padding = 0,
--   color = function()
--     return { fg = mode_color[vim.fn.mode()], bg = "none" }
--   end,
-- }

local left_pad_alt = {
  function()
    return " "
  end,
  padding = 0,
  color = function()
    return { fg = colors.red, bg = "none" }
  end,
}

local right_pad_alt = {
  function()
    return " "
  end,
  padding = 0,
  color = function()
    return { fg = colors.red, bg = "none" }
  end,
}

local hide_in_width = function()
  return vim.o.columns > 80
end

local hide_in_width_100 = function()
  return vim.o.columns > 100
end


local mode = {
  -- mode component
  function()
    -- return "▊"
    return "  "
    -- return "  "
  end,
  color = function()
    -- auto change color according to neovims mode
    return { fg = colors.gray, bg = mode_color[vim.fn.mode()] }
  end,
  padding = 0,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "%#SLGitIcon#" .. " " .. "%*" .. "%#SLBranchName#",
  -- color = "Constant",
  color = function()
    return { fg = colors.gray, bg = mode_color[vim.fn.mode()] }
  end,
  padding = 0,
  -- cond = hide_in_width_100,
  fmt = function(str)
    if str == "" or str == nil then
      return "!=vcs"
    end

    return str
  end,
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = {
    error = "%#SLError#" .. "%*" .. " ",
    warn = "%#SLWarning#" .. "%*" .. " ",
  },
  colored = false,
  update_in_insert = false,
  always_visible = true,
  padding = 0,
}

local current_signature = {
  function()
    local buf_ft = vim.bo.filetype

    if buf_ft == "toggleterm" or buf_ft == "TelescopePrompt" then
      return ""
    end
    if not pcall(require, "lsp_signature") then
      return ""

    end
    local sig = require("lsp_signature").status_line(30)
    local hint = sig.hint

    if not require("user.functions").isempty(hint) then
      -- return "%#SLSeparator#│ : " .. hint .. "%*"
      -- return "%#SLSeparator#│ " .. hint .. "%*"
      return "%#SLSeparator# " .. hint .. "%*"
    end

    return ""
  end,
  cond = hide_in_width_100,
  padding = 0,
}

local language_server = {
  function()
    local buf_ft = vim.bo.filetype
    local ui_filetypes = {
      "help",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
      "lspinfo",
      "lsp-installer",
      "",
    }

    if contains(ui_filetypes, buf_ft) then
      if M.language_servers == nil then
        return ""
      else
        return M.language_servers
      end
    end

    local clients = vim.lsp.buf_get_clients()
    local client_names = {}
    local copilot_active = false

    -- add client
    for _, client in pairs(clients) do
      if client.name ~= "copilot" and client.name ~= "null-ls" then
        table.insert(client_names, client.name)
      end
      if client.name == "copilot" then
        copilot_active = true
      end
    end

    -- add formatter
    local s = require "null-ls.sources"
    local available_sources = s.get_available(buf_ft)
    local registered = {}
    for _, source in ipairs(available_sources) do
      for method in pairs(source.methods) do
        registered[method] = registered[method] or {}
        table.insert(registered[method], source.name)
      end
    end

    local formatter = registered["NULL_LS_FORMATTING"]
    local linter = registered["NULL_LS_DIAGNOSTICS"]
    if formatter ~= nil then
      vim.list_extend(client_names, formatter)
    end
    if linter ~= nil then
      vim.list_extend(client_names, linter)
    end

    -- join client names with commas
    local client_names_str = table.concat(client_names, ", ")

    -- check client_names_str if empty
    local language_servers = ""
    local client_names_str_len = #client_names_str
    if client_names_str_len ~= 0 then
      language_servers = hl_str("", "SLSep") .. hl_str(client_names_str, "SLSeparator") .. hl_str("", "SLSep")
    end

    if client_names_str_len == 0 and not copilot_active then
      return ""
    else
      M.language_servers = language_servers
      return language_servers:gsub(", anonymous source", "")
    end
  end,
  padding = 0,
  cond = hide_in_width,
  -- separator = "%#SLSeparator#" .. " │" .. "%*",
}

local spaces = {
  function()
    local buf_ft = vim.bo.filetype

    local ui_filetypes = {
      "help",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "DressingSelect",
      "",
    }
    local space = ""

    if contains(ui_filetypes, buf_ft) then
      space = " "
    end

    local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")

    if shiftwidth == nil then
      return ""
    end

    -- TODO: update codicons and use their indent
    return hl_str(" ", "SLSep") .. hl_str(" " .. shiftwidth .. space, "SLIndent") .. hl_str("", "SLSep")
  end,
  padding = 0,
  -- separator = "%#SLSeparator#" .. " │" .. "%*",
  -- cond = hide_in_width_100,
}

local filetype = {
  "filetype",
  fmt = function(str)
    local ui_filetypes = {
      "help",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "",
      "nil",
    }

    local return_val = function(_str)
      return hl_str(" ", "SLSep") .. hl_str(_str, "SLFT") .. hl_str("", "SLSep")
    end

    if str == "TelescopePrompt" then
      return return_val("")
    end

    local function get_term_num()
      local t_status_ok, toggle_num = pcall(vim.api.nvim_buf_get_var, 0, "toggle_number")
      if not t_status_ok then
        return ""
      end
      return toggle_num
    end

    if str == "toggleterm" then
      -- 
      local term = "%#SLTermIcon#" .. " " .. "%*" .. "%#SLFT#" .. get_term_num() .. "%*"

      return return_val(term)
    end

    if contains(ui_filetypes, str) then
      return ""
    else
      return return_val(str)
    end
  end,
  icons_enabled = false,
  padding = 0,
}

local location = {
  "location",
  fmt = function(str)
    -- return "▊"
    return hl_str(" ", "SLSep") .. hl_str(str, "SLLocation") .. hl_str(" ", "SLSep")
    -- return "  "
  end,
  padding = 0,
}

local progress = {
  "progress",
  fmt = function()
    -- return "▊"
    return hl_str("", "SLSep") .. hl_str("%P/%L", "SLProgress") .. hl_str(" ", "SLSep")
    -- return "  "
  end,
  -- color = "SLProgress",
  padding = 0,
}

local options = {
  options = {
    globalstatus = true,
    icons_enabled = true,
    -- theme = "auto",
    theme = "tokyonight",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { left_pad_mode, mode, branch, right_pad },
    lualine_b = { left_pad_alt, diagnostics, right_pad_alt },
    lualine_c = { current_signature },
    lualine_x = { language_server, spaces, filetype },
    lualine_y = {  },
    lualine_z = { location, progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

options = require("core.utils").load_override(options, "christianchiarulli/lualine.nvim")

lualine.setup(options)
