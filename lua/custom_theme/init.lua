local M = {}

local { 

{ hg = "Normal" ,,bg=#000000 ,,fg=#ffffff, },

{ hg = "Visual", ,bg=#ffffff, ,fg=#000000, },
{ hg = "Search" ,gui=underline, ,bg=#191a1b, ,fg=#ffffff, },
{ hg = "IncSearch" ,gui=underline,,bg=#a8a8a8, ,fg=#000000, },

{ hg = "StatusLine" ,bg=#ffffff, ,fg=#000000, , },
{ hg = "StatusLineNC"  ,bg=#191a1b ,fg=#a8a8a8  },
{ hg = "StatusLineTerm"  ,bg=#44bc44 ,fg=#000000  },
{ hg = "StatusLineTermNC"  ,bg=#191a1b ,fg=#44bc44  },

{ hg = "VertSplit"  },
{ hg = "TabLine"  ,bg=#191a1b ,fg=#a8a8a8  },
{ hg = "TabLineSel"  ,bg=#00d3d0 ,fg=#000000  },
{ hg = "TabLineFill"  },

{ hg = "Comment" ,gui="italic" ,fg=#a8a8a8  },
{ hg = "Todo" ,bg=#100f10 ,fg=#cfdf30 },

{ hg = "Warning"  ,bg=#eecc00 ,fg=#000000  },
{ hg = "WarningMsg"  ,bg=#eecc00 ,fg=#000000  },
{ hg = "Error"  ,bg=#ff8059 ,fg=#000000  },
{ hg = "ErrorMsg"  ,bg=#ff8059 ,fg=#000000  },

{ hg = "MatchParen" ,bg=#191a1b ,fg=#a8a8a8  },

{ hg = "ToolbarLine" ,bg=#a8a8a8 ,fg=#000000 },
{ hg = "ToolbarButton" ,gui="bold" ,bg=#a8a8a8 ,fg=#000000 },

{ hg = "WildMenu" ,bg=#000000 ,fg=#ffffff },

{ hg = "Terminal" ,bg=#000000 ,fg=#ffffff },

{ hg = "Constant" ,fg=#00bcff },
{ hg = "Boolean" ,fg=#44bc44 },
{ hg = "Number" ,fg=#00bcff },
{ hg = "Float" ,fg=#00bcff },
{ hg = "String" ,fg=#79a8ff },

{ hg = "Function" ,fg=#feacd0 },
{ hg = "Identifier"  ,fg=#00d3d0  },
{ hg = "Label" ,fg=#feacd0 },
{ hg = "Tag" ,fg=#feacd0 },
{ hg = "Keyword"  ,fg=#f78fe7  },

{ hg = "Character" ,gui="bold" ,fg=#6ae4b9 },

{ hg = "Type",fg=#00d3d0 },
{ hg = "StorageClass" ,fg=#00d3d0 },
{ hg = "Structure" ,fg=#00d3d0 },
{ hg = "Typedef" ,gui="bold" ,fg=#6ae4b9 },

{ hg = "Conditional"  ,fg=#b6a0ff  },
{ hg = "Statement"  ,fg=#b6a0ff  },
{ hg = "Repeat" ,gui="bold" ,fg=#f78fe7 },
{ hg = "Operator"  ,fg=#ffffff  },
{ hg = "Exception" ,gui="bold" ,fg=#eecc00 },

{ hg = "Preproc"  ,fg=#f4923b },
{ hg = "PreCondit" ,gui="bold" ,fg=#f4923b },
{ hg = "Macro" ,gui="bold" ,fg=#f78fe7 },
{ hg = "Include" ,fg=#f4923b },
{ hg = "Define" ,fg=#f4923b },

{ hg = "Title" ,gui="bold" ,bg=#000000 ,fg=#00d3d0 },

{ hg = "Delimiter"  ,fg=#ffffff  },
{ hg = "SpecialComment" ,gui="bold" ,fg=#f0ce43 },

{ hg = "Debug" ,fg=#f78fe7 },

{ hg = "LineNr" ,bg=#191a1b ,fg=#a8a8a8  },
{ hg = "Cursor" ,bg=#ffffff ,fg=#000000 },
{ hg = "CursorLine"  ,bg=#191a1b },
{ hg = "CursorColumn"  ,bg=#191a1b },
{ hg = "CursorLineNr" ,gui="bold" ,bg=#a8a8a8 },
{ hg = "ColorColumn" ,bg=#191a1b ,fg=#ffffff },
{ hg = "SignColumn" ,bg=#191a1b ,fg=#a8a8a8  },

{ hg = "Folded" ,bg=#191a1b ,fg=#a8a8a8 },
{ hg = "FoldColumn" ,bg=#191a1b ,fg=#a8a8a8 },

{ hg = "Special"  ,fg=#00cd68 },
{ hg = "SpecialKey"  ,bg=#191a1b ,fg=#a8a8a8  },
{ hg = "SpecialChar" ,gui="bold" ,fg=#cfdf30 },
{ hg = "NonText"  ,bg=#191a1b ,fg=#a8a8a8  },
{ hg = "EndOfBuffer" ,gui="bold" ,fg=#a8a8a8 },

{ hg = "Directory"  ,fg=#44bc44 },
{ hg = "Question" ,gui="bold" ,fg=#cfdf30 },
{ hg = "MoreMsg" ,fg=#70c900 ,fg=10},
{ hg = "ModeMsg" ,gui="bold" ,fg=#44bc44 },

{ hg = "VimOption" ,fg=#4ae8fc },
{ hg = "VimGroup" ,fg=#4ae8fc },

{ hg = "Underlined" ,gui=underline ,fg=#ffffff },
{ hg = "Ignore" ,bg=#191a1b ,fg=#a8a8a8 },
{ hg = "Conceal" ,bg=#a8a8a8 ,fg=#191a1b },

{ hg = "SpellBad" ,bg=#ff8059 ,fg=#000000 },
{ hg = "SpellCap" ,bg=#eecc00 ,fg=#000000 },
{ hg = "SpellRare" ,bg=#b6a0ff ,fg=#000000 },
{ hg = "SpellLocal" ,bg=#6ae4b9 ,fg=#000000 },

{ hg = "Pmenu" ,gui="italic" ,bg=#191a1b ,fg=#ffffff  },
{ hg = "PmenuSel" ,bold ,bg=#a8a8a8 ,fg=#000000 ,},
{ hg = "PmenuSbar" ,bg=#191a1b },
{ hg = "PmenuThumb" ,bg=#a8a8a8 },

  -- Diagnostics
  { hg = 'DiagnosticError', fg = colors.red },
  { hg = 'DiagnosticWarn', fg = colors.yellow },
  { hg = 'DiagnosticInfo',fg = colors.blue },
  { hg = 'DiagnosticHint', fg = colors.green },
  { hg = 'DiagnosticUnderlineError', fg = colors.red, ,gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineWarn', fg = colors.yellow, ,gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineInfo', fg = colors.blue, ,gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineHint', fg = colors.green, ,gui = 'underline', cterm = 'underline' },

  -- Neovim's built-in language server client
  { hg = 'LspReferenceWrite',fg = colors.blue, ,gui='underline' },
  { hg = 'LspReferenceText', fg = colors.blue, ,gui='underline' },
  { hg = 'LspReferenceRead', fg = colors.blue, ,gui='underline' },
  { hg = 'LspSignatureActiveParameter', fg=colors.yellow, ,gui='bold' },

  -- ... an exception for my favorite plugin
  { hg = 'GitSignsAdd', fg = colors.purple },
  { hg = 'GitSignsChange', fg = colors.yellow },
  { hg = 'GitSignsDelete', fg = colors.red },

}

M.colorscheme = function()
  local { hg =ghlight_cmds = {}
  for idx = 1, #{ hg =ghlights do
    local { hg =ghlight = { hg =ghlights[idx]
    { hg =ghlight_cmds[idx] = string.format(
      '{ hg =ghlight %s ,fg=%s ,bg=%s ,gui=%s ,guisp=%s',
      { hg =ghlight.hg,
      { hg =ghlight.,fg or 'NONE',
      { hg =ghlight.,bg or 'NONE',
      { hg =ghlight.,gui or 'NONE',
      { hg =ghlight.,guisp or 'NONE'
    )
  end
  vim.cmd(table.concat({ hg =ghlight_cmds, '\n'))
end

return M
