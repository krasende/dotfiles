vim.cmd.highlight('clear')
vim.g.colors_name = 'default'

-- colorscheme
-- :h group-name
vim.api.nvim_set_hl(0, "Comment", { ctermfg = "Gray" })
vim.api.nvim_set_hl(0, "Constant", { ctermfg = "Green" })
vim.api.nvim_set_hl(0, "Identifier", { ctermfg = "White" })
vim.api.nvim_set_hl(0, "Function", { ctermfg = "Yellow" })
vim.api.nvim_set_hl(0, "Statement", { ctermfg = "Red" })
vim.api.nvim_set_hl(0, "PreProc", { ctermfg = "Blue" })
vim.api.nvim_set_hl(0, "Type", { ctermfg = "Cyan" })
vim.api.nvim_set_hl(0, "Special", { ctermfg = "Magenta" })
vim.api.nvim_set_hl(0, "Underlined", { ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "Added", { ctermfg = "Green" })
vim.api.nvim_set_hl(0, "Changed", { ctermfg = "Yellow" })
vim.api.nvim_set_hl(0, "Removed", { ctermfg = "Red" })
vim.api.nvim_set_hl(0, "Ignore", { ctermfg = "Gray" })
vim.api.nvim_set_hl(0, "Error", { ctermfg = "Red" })
vim.api.nvim_set_hl(0, "Todo", { ctermfg = "Magenta" })

-- :h highlight-groups
vim.api.nvim_set_hl(0, "Normal", { ctermfg = "White" })
vim.api.nvim_set_hl(0, "NonText", { ctermfg = "DarkGray" })
vim.api.nvim_set_hl(0, "Title", { ctermfg = "White", bold = true })
vim.api.nvim_set_hl(0, "WinSeparator", { link = "NonText"}) 
vim.api.nvim_set_hl(0, "Cursor", { standout = true })
vim.api.nvim_set_hl(0, "CursorLine", { })
vim.api.nvim_set_hl(0, "CursorLineNr", { link = "Title" }) 
vim.api.nvim_set_hl(0, "LineNr", { link = "NonText" }) 
vim.api.nvim_set_hl(0, "Directory", { ctermfg = "Blue", bold = true }) 
vim.api.nvim_set_hl(0, "MatchParen", { underline = true }) 
vim.api.nvim_set_hl(0, "Search", { standout = true }) 
vim.api.nvim_set_hl(0, "CurSearch", { standout = true, underline = true }) 
vim.api.nvim_set_hl(0, "Pmenu", {}) 
vim.api.nvim_set_hl(0, "PmenuSel", { standout = true }) 
vim.api.nvim_set_hl(0, "PmenuMatch", { underline = true }) 
vim.api.nvim_set_hl(0, "PmenuSbar", { ctermbg = "Black" }) 
vim.api.nvim_set_hl(0, "PmenuThumb", { ctermbg = "DarkGray" }) 
vim.api.nvim_set_hl(0, "PmenuBorder", { ctermfg = "DarkGray" }) 
vim.api.nvim_set_hl(0, "QuickFixLine", { link = "PmenuSel" }) 
vim.api.nvim_set_hl(0, "StatusLine", { ctermfg = "White", ctermbg = "Black" }) 
vim.api.nvim_set_hl(0, "StatusLineNC", { ctermfg = "DarkGray", ctermbg = "Black" }) 
vim.api.nvim_set_hl(0, "StatusLineTerm", { link = "StatusLine" })
vim.api.nvim_set_hl(0, "StatusLineTermNC", { link = "StatusLineNC" })
vim.api.nvim_set_hl(0, "TabLine", { link = "StatusLine" })
vim.api.nvim_set_hl(0, "TabLineFill", { link = "StatusLineNC" })
vim.api.nvim_set_hl(0, "Visual", { standout = true })
vim.api.nvim_set_hl(0, "ErrorMsg", { link = "Error" })
vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "LightRed" })
vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = "LightBlue" })
vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = "LightGreen" })
vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = "LightMagenta" })
vim.api.nvim_set_hl(0, "DiffAdd", { ctermfg = "Green" })
vim.api.nvim_set_hl(0, "DiffChange", { ctermfg = "Yellow" })
vim.api.nvim_set_hl(0, "DiffDelete", { ctermfg = "Red" })
vim.api.nvim_set_hl(0, "DiffText", { standout = true })
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = "Black" })

-- diagnostics (:h diagnostic-highlights)
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { link = "SpellBad" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { link = "SpellCap" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { link = "SpellRare" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { link = "SpellRare" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineOk", { link = "SpellLocal" })

-- treesitter (:h treesitter-highlight-groups)
vim.api.nvim_set_hl(0, "@module", { link = "Identifier" });
vim.api.nvim_set_hl(0, "@module.builtin", { link = "@module" });
vim.api.nvim_set_hl(0, "@type.builtin", { ctermfg = "Blue" });
vim.api.nvim_set_hl(0, "@constructor", { link = "@function" });
vim.api.nvim_set_hl(0, "@tag", { link = "Type" });
vim.api.nvim_set_hl(0, "@tag.builtin", { link = "@tag" });
vim.api.nvim_set_hl(0, "@tag.angular", { link = "@tag" });
vim.api.nvim_set_hl(0, "@tag.attribute", { link = "@type.builtin" });
vim.api.nvim_set_hl(0, "@constant.builtin", { link = "@constant" });
vim.api.nvim_set_hl(0, "@function.builtin", { link = "@function" });
vim.api.nvim_set_hl(0, "@variable.builtin", { link = "@variable" });

-- markdown
vim.api.nvim_set_hl(0, "@markup.heading.1", { ctermfg = "Red", bold = true });
vim.api.nvim_set_hl(0, "@markup.heading.2", { ctermfg = "Green", bold = true });
vim.api.nvim_set_hl(0, "@markup.heading.3", { ctermfg = "Blue", bold = true });
vim.api.nvim_set_hl(0, "@markup.link.label", { ctermfg = "White", bold = true });
vim.api.nvim_set_hl(0, "@markup.link.url", { ctermfg = "Blue", italic = true });
