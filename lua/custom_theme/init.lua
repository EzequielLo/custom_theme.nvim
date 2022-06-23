local M = {}

local colors = {
  color0  = '#000000',
	color1  = '#a60000',
	color2  = '#005e00',
	color3  = '#813e00',
	color4  = '#0031a9',
	color5  = '#721045',
	color6  = '#00538b',
	color7  = '#bfbfbf',
	color8  = '#595959',
	color9  = '#972500',
	color10 = '#315b00',
	color11 = '#70480f',
	color12 = '#2544bb',
	color13 = '#5317ac',
	color14 = '#005a5f',
	color15 = '#ffffff',
  color16 = '#0000c0',
	color17 = '#8f0075',
  color19 = '#f0f0f0',
  color20 = '#505050',
  color21 = '#145c33',
}


local highlights = {

  -- Syntax Groups (descriptions and ordering from `:h w18`)
  { hg = 'Comment', fg = colors.color20, gui = 'italic', cterm = 'italic' }, -- any comment
  { hg = 'Constant', fg = colors.color16 }, --any constant
  { hg = 'String', fg = colors.color12 }, --a string constant: "this is a string"
  { hg = 'Character', fg = colors.color14 }, --a character constant: 'c', '\n'
  { hg = 'Number', fg = colors.color16}, --a number constant: 234, 0xff
  { hg = 'Boolean', fg = colors.color6}, --a boolean constant: TRUE, false
  { hg = 'Float', fg = colors.color16 }, --a floating point constant: 2.3e10
  { hg = 'Identifier', fg = colors.color6 }, --any variable name
  { hg = 'Function', fg = colors.color5}, --function name (also: methods for classes)
  { hg = 'Statement', fg = colors.color13 }, --any statement
  { hg = 'Conditional', fg = colors.color13 }, --if, then, else, endif, switch, etc.
  { hg = 'Repeat', fg = colors.color17 }, --for, do, while, etc.
  { hg = 'Label', fg = colors.color5 }, --case, default, etc.
  { hg = 'Operator', fg = colors.color0 }, --sizeof", "+", "*", etc.
  { hg = 'Keyword', fg = colors.color17 }, --any other keyword
  { hg = 'Exception', fg = colors.color18 }, --try, catch, throw
  { hg = 'PreProc', fg = colors.color9 }, --generic Preprocessor
  { hg = 'Include', fg = colors.color9}, --preprocessor #include
  { hg = 'Define', fg = colors.color9 }, --preprocessor #define
  { hg = 'Macro', fg = colors.color17}, --same as Define
  { hg = 'PreCondit', fg = colors.color9 }, --preprocessor #if, #else, #endif, etc.
  { hg = 'Type', fg = colors.color6 }, --int, long, char, etc.
  { hg = 'StorageClass', fg = colors.color6 }, --static, register, volatile, etc.
  { hg = 'Structure', fg = colors.color6 }, --struct, union, enum, etc.
  { hg = 'Typedef', fg = colors.color14 }, --A typedef
  { hg = 'Special', fg = colors.color21}, --any special symbol
  { hg = 'SpecialChar', fg = colors.color11 }, --special character in a constant
  { hg = 'Tag', fg = colors.color5 }, --you can use CTRL-] on this
  { hg = 'Delimiter', fg = colors.color0 }, --character that needs attention
  { hg = 'SpecialComment', fg = colors.color3 }, --special things inside a comment
  { hg = 'Debug', fg = colors.color17 }, --debugging statements
  { hg = 'Underlined', gui = 'underline', cterm = 'underline' }, --text that stands out, HTML links
  { hg = 'Ignore' }, --left blank, hidden
  { hg = 'Error', fg = colors.color3 }, --any erroneous construct
  { hg = 'Todo', fg = colors.color11 }, --anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`) {{{
  { hg = 'ColorColumn', bg = colors.color19 }, --used for the columns set with 'colorcolumn'
  { hg = 'Conceal' }, --placeholder characters substituted for concealed text (see 'conceallevel')
  { hg = 'Cursor', fg = colors.color20, bg = colors.color19 }, --the character under the cursor
  { hg = 'CursorIM' }, --like Cursor, but used when in IME mode
  { hg = 'CursorLine', bg = colors.color19 }, --the screen line that the cursor is in when 'cursorline' is set
  { hg = 'Directory', fg = colors.color14 }, --directory names (and other special names in listings)
  { hg = 'DiffAdd', bg = colors.color14, fg = colors.color15 }, --diff mode: Added line
  { hg = 'DiffChange', fg = colors.color15, gui = 'underline', cterm = 'underline' }, --diff mode: Changed line
  { hg = 'DiffDelete', bg = colors.color3, fg = colors.color15 }, --diff mode: Deleted line
  { hg = 'DiffText', bg = colors.color19, fg = colors.color9 }, --diff mode: Changed text within a changed line
  { hg = 'ErrorMsg', fg = colors.color3 }, --error messages on the command line
  { hg = 'VertSplit'}, --the column separating vertically split windows
  { hg = 'Folded', fg = colors.color20 }, --line used for closed folds
  { hg = 'FoldColumn' }, --'foldcolumn'
  { hg = 'SignColumn' }, --column where signs are displayed
  { hg = 'IncSearch', fg = colors.color15, bg = colors.color20 }, --'incsearch' highlighting; also used for the text replaced with ":s///c"
  { hg = 'LineNr', fg = colors.color20 }, --Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  { hg = 'CursorLineNr' }, --Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
  { hg = 'MatchParen', fg = colors.color20, gui = 'underline', cterm = 'underline' }, --The character under the cursor or just before it, if it is a paired bracket, and its match.
  { hg = 'ModeMsg' }, --'showmode' message (e.g., "-- INSERT --")
  { hg = 'MoreMsg' }, --more-prompt
  { hg = 'NonText', fg = colors.color20}, --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
  { hg = 'Normal', fg = colors.color0, bg = colors.color15 }, --normal text
  { hg = 'Pmenu', fg = colors.color15, bg = colors.color20 }, --Popup menu: normal item.
  { hg = 'PmenuSel', fg = colors.color15, bg = colors.color20}, --Popup menu: selected item.
  { hg = 'PmenuSbar', bg = colors.color19 }, --Popup menu: scrollbar.
  { hg = 'PmenuThumb', bg = colors.color20 }, --Popup menu: Thumb of the scrollbar.
  { hg = 'Question', fg = colors.color11 }, --hit-enter prompt and yes/no questions
 -- { hg = 'QuickFixLine', fg = colors.black, bg = colors.yellow }, --Current quickfix item in the quickfix window.
  { hg = 'Search', fg = colors.color0, bg = colors.color19 }, --Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  { hg = 'SpecialKey', fg = colors.color20 }, --Meta and special keys listed with " =map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
  { hg = 'SpellBad', fg = colors.color15, gui = 'underline', cterm = 'underline' }, --Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
  { hg = 'SpellCap', fg = colors.color15 }, --Word that should start with a capital. This will be combined with the highlighting used otherwise.
  { hg = 'SpellLocal', fg = colors.color15 }, --Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
  { hg = 'SpellRare', fg = colors.color3 }, --Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
  { hg = 'StatusLine', fg = colors.color15, bg = colors.color3 }, --status line of current window
  { hg = 'StatusLineNC', fg = colors.color20 }, --status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  { hg = 'StatusLineTerm', fg = colors.color20, bg = colors.color14 }, --status line of current :terminal window
  { hg = 'StatusLineTermNC', fg = colors.color14 }, --status line of non-current  =terminal window
  { hg = 'TabLine', fg = colors.color20 }, --tab pages line, not active tab page label
  { hg = 'TabLineFill' }, --tab pages line, where there are no labels
  { hg = 'TabLineSel', fg = colors.color15 }, --tab pages line, active tab page label
  { hg = 'Terminal', fg = colors.color0, bg = colors.color15 }, --terminal window (see terminal-size-color)
  { hg = 'Title', fg = colors.color6 }, --titles for output from " =set all", ":autocmd" etc.
  { hg = 'Visual', bg = colors.color0 }, --Visual mode selection
  --{ hg = 'VisualNOS', bg = colors.visual_grey }, --Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
  { hg = 'WarningMsg', fg = colors.color15 }, --warning messages
  { hg = 'WildMenu', fg = colors.color0, bg = colors.color15 }, --current match in 'wildmenu' completion

  -- Diagnostics
  { hg = 'DiagnosticError', fg = colors.color18 },
  { hg = 'DiagnosticWarn', fg = colors.color11 },
  { hg = 'DiagnosticInfo', fg = colors.color12 },
  { hg = 'DiagnosticHint', fg = colors.color14 },
  { hg = 'DiagnosticUnderlineError', fg = colors.color3, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineWarn', fg = colors.color11, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineInfo', fg = colors.color4, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineHint', fg = colors.color14, gui = 'underline', cterm = 'underline' },

  -- Neovim's built-in language server client
  { hg = 'LspReferenceWrite', fg = colors.color4, gui='underline' },
  { hg = 'LspReferenceText', fg = colors.color4, gui='underline' },
  { hg = 'LspReferenceRead', fg = colors.color4, gui='underline' },
  { hg = 'LspSignatureActiveParameter', fg=colors.color11, gui='bold' },

  -- GitSings
  { hg = 'GitSignsAdd', fg = colors.color2 },
  { hg = 'GitSignsChange', fg = colors.color11 },
  { hg = 'GitSignsDelete', fg = colors.color18 },

-- CSS
--  { hg ="cssAttrComma",  fg=colors.purple },
--  { hg ="cssAttributeSelector", fg=colors.green },
--  { hg ="cssBraces", fg= colors.white },
--  { hg ="cssClassName", fg= colors.dark_yellow },
--  { hg ="cssClassNameDot", fg= colors.dark_yellow },
--  { hg ="cssDefinition", fg= colors.purple },
--  { hg ="cssFontAttr", fg= colors.dark_yellow },
--  { hg ="cssFontDescriptor", fg= colors.purple },
--  { hg ="cssFunctionName", fg= colors.blue },
--  { hg ="cssIdentifier", fg= colors.blue },
--  { hg ="cssImportant", fg= colors.purple },
--  { hg ="cssInclude", fg= colors.white },
--  { hg ="cssIncludeKeyword", fg= colors.purple },
--  { hg ="cssMediaType", fg= colors.dark_yellow },
--  { hg ="cssProp", fg= colors.white },
--  { hg ="cssPseudoClassId", fg= colors.dark_yellow },
--  { hg ="cssSelectorOp", fg= colors.purple },
--  { hg ="cssSelectorOp2", fg= colors.purple },
--  { hg ="cssTagName", fg= colors.dark_red },

-- HTML (keep consistent with Markdown, below)
--  { hg ="htmlArg", fg= colors.dark_yellow },
--  { hg ="htmlBold", fg= colors.dark_yellow, gui= "bold", cterm= "bold" },
--  { hg ="htmlBoldItalic", fg= colors.green, gui= "bold,italic", cterm= "bold,italic" },
--  { hg ="htmlEndTag", fg= colors.white },
--  { hg ="htmlH1", fg= colors.dark_red },
--  { hg ="htmlH2", fg= colors.dark_red },
--  { hg ="htmlH3", fg= colors.dark_red },
--  { hg ="htmlH4", fg= colors.dark_red },
--  { hg ="htmlH5", fg= colors.dark_red },
--  { hg ="htmlH6", fg= colors.dark_red },
--  { hg ="htmlItalic", fg= colors.purple, gui= "italic", cterm= "italic" },
--  { hg ="htmlLink", fg= colors.cyan, gui= "underline", cterm= "underline" },
--  { hg ="htmlSpecialChar", fg= colors.dark_yellow },
--  { hg ="htmlSpecialTagName", fg= colors.dark_red },
--  { hg ="htmlTag", fg= colors.white },
--  { hg ="htmlTagN", fg= colors.dark_red },
--  { hg ="htmlTagName", fg= colors.dark_red },
--  { hg ="htmlTitle", fg= colors.white },

-- JavaScript
 -- { hg ="javaScriptBraces", fg= colors.white },
  --{ hg ="javaScriptFunction", fg= colors.purple },
  --{ hg ="javaScriptIdentifier", fg= colors.purple },
  --{ hg ="javaScriptNull", fg= colors.dark_yellow },
  --{ hg ="javaScriptNumber", fg= colors.dark_yellow },
  --{ hg ="javaScriptRequire", fg= colors.cyan },
  --{ hg ="javaScriptReserved", fg= colors.purple },

  -- typescript
	--{ hg = "typescriptTSType" , fg = colors.yellow },
  --{ hg = "typescriptTSConstructor" , fg = colors.yellow},
  --{ hg = "typescriptTSTypeBuiltin" , fg = colors.dark_yellow},

-- JSON
--  { hg ="jsonCommentError", fg= colors.white },
--  { hg ="jsonKeyword", fg= colors.dark_red },
--  { hg ="jsonBoolean", fg= colors.dark_yellow },
--  { hg ="jsonNumber", fg= colors.dark_yellow },
--  { hg ="jsonQuote", fg= colors.white },
--  { hg ="jsonMissingCommaError", fg= colors.dark_red, gui= "reverse" },
--  { hg ="jsonNoQuotesError", fg= colors.dark_red, gui= "reverse" },
--  { hg ="jsonNumError", fg= colors.dark_red, gui= "reverse" },
--  { hg ="jsonString", fg= colors.green },
--  { hg ="jsonStringSQError", fg= colors.dark_red, gui= "reverse" },
--  { hg ="jsonSemicolonError", fg= colors.dark_red, gui= "reverse" },

-- Markdown (keep consistent with HTML, above)
--  { hg ="markdownBlockquote", fg= colors.comment_grey },
--  { hg ="markdownBold", fg= colors.dark_yellow, gui= "bold", cterm= "bold" },
--  { hg ="markdownBoldItalic", fg= colors.green, gui= "bold,italic", cterm= "bold,italic" },
--  { hg ="markdownCode", fg= colors.green },
--  { hg ="markdownCodeBlock", fg= colors.green },
--  { hg ="markdownCodeDelimiter", fg= colors.green },
--  { hg ="markdownH1", fg= colors.dark_red },
--  { hg ="markdownH2", fg= colors.dark_red },
--  { hg ="markdownH3", fg= colors.dark_red },
--  { hg ="markdownH4", fg= colors.dark_red },
--  { hg ="markdownH5", fg= colors.dark_red },
--  { hg ="markdownH6", fg= colors.dark_red },
--  { hg ="markdownHeadingDelimiter", fg= colors.dark_red },
--  { hg ="markdownHeadingRule", fg= colors.comment_grey },
--  { hg ="markdownId", fg= colors.purple },
--  { hg ="markdownIdDeclaration", fg= colors.blue },
--  { hg ="markdownIdDelimiter", fg= colors.purple },
--  { hg ="markdownItalic", fg= colors.purple, gui= "italic", cterm= "italic" },
--  { hg ="markdownLinkDelimiter", fg= colors.purple },
--  { hg ="markdownLinkText", fg= colors.blue },
--  { hg ="markdownListMarker", fg= colors.dark_red },
--  { hg ="markdownOrderedListMarker", fg= colors.dark_red },
--  { hg ="markdownRule", fg= colors.comment_grey },
--  { hg ="markdownUrl", fg= colors.cyan, gui= "underline", cterm= "underline" },

  -- Tree-sitter
  --{ hg =  "TSAnnotation " , fg = colors.red},
  --{ hg =  "TSAttribute" , fg = colors.purple},
  --{ hg =  "TSBoolean " , fg = colors.dark_yellow},
  --{ hg =  "TSCharacter" , fg = colors.green},
  --{ hg =  "TSComment" , fg = colors.green},
  --{ hg =  "SConditional" , fg = colors.green},
  --{ hg =  "TSNote" , fg = colors.yellow},
  --{ hg =  "TSWarning" , fg = colors.bg, bg=colors.warning},
  --{ hg =  "TSDanger" , fg = colors.bg, bg=colors.error},
  --{ hg =  "TSConstant " , fg = colors.white},
  --{ hg =  "commentTSConstant" , fg = colors.keyword},
  --{ hg =  "TSConstBuiltin" , fg = colors.dark_yellow, gui="bold"},
  --{ hg =  "TSConstMacro" , fg = colors.white},
  --{ hg =  "TSConstructor" , fg = colors.white,gui="bold"},
  --{ hg =  "TSError" , fg = colors.green},
  --{ hg =  "TSException" , fg = colors.cyan},
  --{ hg =  "TSField" , fg = colors.white},
  --{ hg =  "TSFloat " , fg = colors.blue},
  --{ hg =  "TSFunction" , fg = colors.blue},
  --{ hg =  "TSFuncBuiltin" , fg = colors.dark_yellow, gui="bold"},
  --{ hg =  "TSFuncMacro" , fg = colors.blue},
  --{ hg =  "TSInclude " , fg = colors.purple},
  --{ hg =  "TSKeyword" , fg = colors.purple},
  --{ hg =  "TSKeywordFunction" , fg = colors.purple},
  --{ hg =  "TSKeywordOperator" , fg = colors.purple},
  --{ hg =  "TSKeywordReturn" , fg = colors.magneta},
  --{ hg =  "TSLabel" , fg = colors.purple},
  --{ hg =  "TSMethod" , fg = colors.blue},
  --{ hg =  "TSNamespace" , fg = colors.yellow},
  --{ hg =  "TSNone" , fg = colors.green},
  --{ hg =  "TSNumber" , fg = colors.purple},
  --{ hg =  "TSOperator" , fg = colors.foreground},
  --{ hg =  "TSParameter" , fg = colors.white},
  --{ hg =  "TSParameterReference" , fg = colors.red},
  --{ hg =  "TSPreProc" , fg = colors.base00},
  --{ hg =  "TSProperty" , fg = colors.white},
  --{ hg =  "TSString" , fg = colors.green},
  --{ hg =  "TSStringRegex" , fg = colors.green},
  --{ hg =  "TSStringEscape" , fg = colors.yellow},
  --{ hg =  "TSStringSpecial" , fg = blue},
  --{ hg =  "TSRepeat" , fg = colors},
  --{ hg =  "TSStorageClass" , fg = colors},
  --{ hg =  "TSType " , fg = colors.yellow},
  --{ hg =  "TSTypeBuiltin " , fg = colors.dark_yellow, gui ="bold"},
  --{ hg =  "TSTypeDefinition" , fg = colors},
  --{ hg =  "TSTypeQualifier" , fg = colors.cyan},
  --{ hg =  "TSVariable" , fg = colors.white},
  --{ hg =  "TSVariableBuiltin", fg = colors.yellow, gui="bold"},
  --{ hg =  'TSTag', fg = colors.red},
  --{ hg =  'TSTagAttribute', fg = colors.red},
  --{ hg =  'TSPunctDelimiter', fg = colors.white},
  --{ hg =  "TSTitle " , fg = colors.dark_yellow, gui="bold"},
  --{ hg =  "TSLiteral ", fg = colors.green},
  --{ hg =  'TSURI ', fg = colors.cyan},
  --{ hg =  'TSPunctSpecial', fg = colors.cyan},
  --{ hg =  'TSTagDelimiter', fg = colors.red},
  --{ hg =  'TSPunctBracket', fg = colors.white},
  --{ hg =  'TSText', fg = colors.foreground},
  --{ hg =  'TSTextReference ', fg = colors.red},

  --ts_rainbow
	 { hg = 'rainbowcol1', fg = colors.color20, bg = colors.none },
	 { hg = 'rainbowcol2', fg = colors.color11, bg = colors.none },
	 { hg = 'rainbowcol3', fg = colors.color4 , bg = colors.none },
	 { hg = 'rainbowcol4', fg = colors.color3, bg = colors.none },
	 { hg = 'rainbowcol5', fg = colors.color5, bg = colors.none },
	 { hg = 'rainbowcol6', fg = colors.color10, bg = colors.none },
	 { hg = 'rainbowcol7', fg = colors.color6, bg = colors.none },
}

M.colorscheme = function()
  local highlight_cmds = {}
  for idx = 1, #highlights do
    local highlight = highlights[idx]
    highlight_cmds[idx] = string.format(
      'highlight %s guifg=%s guibg=%s gui=%s guisp=%s',
      highlight.hg,
      highlight.fg or 'NONE',
      highlight.bg or 'NONE',
      highlight.gui or 'NONE',
      highlight.guisp or 'NONE'
    )
  end
  vim.cmd(table.concat(highlight_cmds, '\n'))
end

return M
