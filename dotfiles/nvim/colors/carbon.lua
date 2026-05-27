vim.cmd("hi clear")
vim.o.background = "dark"
vim.g.colors_name = "carbon"

local c = {
  bg      = "#1a1a1a",
  bg2     = "#222222",
  bg3     = "#2a2a2a",
  border  = "#3a3a3a",
  fg      = "#d4d4d4",
  grey    = "#666666",
  red     = "#cc6666",
  green   = "#7aab7a",
  yellow  = "#d4a96a",
  blue    = "#6a8fbf",
  magenta = "#9a7abf",
  cyan    = "#6aabab",
  white   = "#c0c0c0",
}

local hl = vim.api.nvim_set_hl

hl(0, "Normal", { fg = c.fg, bg = c.bg })
hl(0, "NormalFloat", { fg = c.fg, bg = c.bg2 })
hl(0, "Comment", { fg = c.grey, italic = true })
hl(0, "Keyword", { fg = c.blue, bold = true })
hl(0, "Function", { fg = c.blue })
hl(0, "String", { fg = c.green })
hl(0, "Number", { fg = c.yellow })
hl(0, "Boolean", { fg = c.yellow })
hl(0, "Type", { fg = c.cyan })
hl(0, "Constant", { fg = c.magenta })
hl(0, "Identifier", { fg = c.fg })
hl(0, "Operator", { fg = c.cyan })
hl(0, "PreProc", { fg = c.magenta })
hl(0, "Special", { fg = c.cyan })
hl(0, "Error", { fg = c.red })
hl(0, "Warning", { fg = c.yellow })
hl(0, "CursorLine", { bg = c.bg2 })
hl(0, "CursorLineNr", { fg = c.yellow })
hl(0, "LineNr", { fg = c.grey })
hl(0, "SignColumn", { bg = c.bg })
hl(0, "StatusLine", { fg = c.fg, bg = c.bg3 })
hl(0, "Pmenu", { fg = c.fg, bg = c.bg2 })
hl(0, "PmenuSel", { fg = c.bg, bg = c.blue })
hl(0, "Visual", { bg = c.bg3 })
hl(0, "Search", { fg = c.bg, bg = c.yellow })
hl(0, "MatchParen", { fg = c.cyan, bold = true })
hl(0, "FloatBorder", { fg = c.border })
hl(0, "WinSeparator", { fg = c.border })
