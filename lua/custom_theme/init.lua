local M = {}

local colors = {
  magneta = '#A9A1E1',
  magneta_bright = '#FFA8FF',
  red = '#E06C75',
  dark_red = '#BE5046',
  green = '#98C379',
  yellow = '#E5C07B',
  dark_yellow = '#D19A66',
  blue = '#61AFEF',
  purple = '#C678DD',
  cyan = '#56B6C2',
  white = '#ABB2BF',
  black = '#282C34',
  foreground = '#ABB2BF',
  background = '#282C34',
  comment_grey = '#5C6370',
  gutter_fg_grey = '#4B5263',
  cursor_grey = '#2C323C',
  visual_grey = '#3E4452',
  menu_grey = '#3E4452',
  special_grey = '#3B4048',
  vertsplit = '#3E4452',
}


local highlights = {
  -- Syntax Groups (descriptions and ordering from `:h w18`)
  { hg = 'Comment', fg = colors.comment_grey, gui = 'italic', cterm = 'italic' }, -- any comment
  { hg = 'Constant', fg = colors.cyan }, --any constant
  { hg = 'String', fg = colors.green }, --a string constant: "this is a string"
  { hg = 'Character', fg = colors.green }, --a character constant: 'c', '\n'
  { hg = 'Number', fg = colors.dark_yellow }, --a number constant: 234, 0xff
  { hg = 'Boolean', fg = colors.dark_yellow }, --a boolean constant: TRUE, false
  { hg = 'Float', fg = colors.dark_yellow }, --a floating point constant: 2.3e10
  { hg = 'Identifier', fg = colors.dark_yellow }, --any variable name
  { hg = 'Function', fg = colors.blue }, --function name (also: methods for classes)
  { hg = 'Statement', fg = colors.purple }, --any statement
  { hg = 'Conditional', fg = colors.purple }, --if, then, else, endif, switch, etc.
  { hg = 'Repeat', fg = colors.purple }, --for, do, while, etc.
  { hg = 'Label', fg = colors.purple }, --case, default, etc.
  { hg = 'Operator', fg = colors.purple }, --sizeof", "+", "*", etc.
  { hg = 'Keyword', fg = colors.purple }, --any other keyword
  { hg = 'Exception', fg = colors.purple }, --try, catch, throw
  { hg = 'PreProc', fg = colors.yellow }, --generic Preprocessor
  { hg = 'Include', fg = colors.blue }, --preprocessor #include
  { hg = 'Define', fg = colors.purple }, --preprocessor #define
  { hg = 'Macro', fg = colors.purple }, --same as Define
  { hg = 'PreCondit', fg = colors.yellow }, --preprocessor #if, #else, #endif, etc.
  { hg = 'Type', fg = colors.yellow }, --int, long, char, etc.
  { hg = 'StorageClass', fg = colors.yellow }, --static, register, volatile, etc.
  { hg = 'Structure', fg = colors.yellow }, --struct, union, enum, etc.
  { hg = 'Typedef', fg = colors.yellow }, --A typedef
  { hg = 'Special', fg = colors.blue }, --any special symbol
  { hg = 'SpecialChar', fg = colors.magneta }, --special character in a constant
  { hg = 'Tag' }, --you can use CTRL-] on this
  { hg = 'Delimiter' }, --character that needs attention
  { hg = 'SpecialComment', fg = colors.comment_grey }, --special things inside a comment
  { hg = 'Debug' }, --debugging statements
  { hg = 'Underlined', gui = 'underline', cterm = 'underline' }, --text that stands out, HTML links
  { hg = 'Ignore' }, --left blank, hidden
  { hg = 'Error', fg = colors.dark_yellow }, --any erroneous construct
  { hg = 'Todo', fg = colors.purple }, --anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`) {{{
  { hg = 'ColorColumn', bg = colors.cursor_grey }, --used for the columns set with 'colorcolumn'
  { hg = 'Conceal' }, --placeholder characters substituted for concealed text (see 'conceallevel')
  { hg = 'Cursor', fg = colors.black, bg = colors.blue }, --the character under the cursor
  { hg = 'CursorIM' }, --like Cursor, but used when in IME mode
  { hg = 'CursorLine', bg = colors.cursor_grey }, --the screen line that the cursor is in when 'cursorline' is set
  { hg = 'Directory', fg = colors.blue }, --directory names (and other special names in listings)
  { hg = 'DiffAdd', bg = colors.green, fg = colors.black }, --diff mode: Added line
  { hg = 'DiffChange', fg = colors.yellow, gui = 'underline', cterm = 'underline' }, --diff mode: Changed line
  { hg = 'DiffDelete', bg = colors.dark_yellow, fg = colors.black }, --diff mode: Deleted line
  { hg = 'DiffText', bg = colors.yellow, fg = colors.black }, --diff mode: Changed text within a changed line
  { hg = 'ErrorMsg', fg = colors.dark_yellow }, --error messages on the command line
  { hg = 'VertSplit', fg = colors.vertsplit }, --the column separating vertically split windows
  { hg = 'Folded', fg = colors.comment_grey }, --line used for closed folds
  { hg = 'FoldColumn' }, --'foldcolumn'
  { hg = 'SignColumn' }, --column where signs are displayed
  { hg = 'IncSearch', fg = colors.yellow, bg = colors.comment_grey }, --'incsearch' highlighting; also used for the text replaced with ":s///c"
  { hg = 'LineNr', fg = colors.gutter_fg_grey }, --Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  { hg = 'CursorLineNr' }, --Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
  { hg = 'MatchParen', fg = colors.blue, gui = 'underline', cterm = 'underline' }, --The character under the cursor or just before it, if it is a paired bracket, and its match.
  { hg = 'ModeMsg' }, --'showmode' message (e.g., "-- INSERT --")
  { hg = 'MoreMsg' }, --more-prompt
  { hg = 'NonText', fg = colors.special_grey }, --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
  { hg = 'Normal', fg = colors.foreground, bg = colors.background }, --normal text
  { hg = 'Pmenu', fg = colors.white, bg = colors.menu_grey }, --Popup menu: normal item.
  { hg = 'PmenuSel', fg = colors.cursor_grey, bg = colors.blue }, --Popup menu: selected item.
  { hg = 'PmenuSbar', bg = colors.cursor_grey }, --Popup menu: scrollbar.
  { hg = 'PmenuThumb', bg = colors.white }, --Popup menu: Thumb of the scrollbar.
  { hg = 'Question', fg = colors.purple }, --hit-enter prompt and yes/no questions
  { hg = 'QuickFixLine', fg = colors.black, bg = colors.yellow }, --Current quickfix item in the quickfix window.
  { hg = 'Search', fg = colors.black, bg = colors.yellow }, --Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  { hg = 'SpecialKey', fg = colors.special_grey }, --Meta and special keys listed with " =map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
  { hg = 'SpellBad', fg = colors.dark_yellow, gui = 'underline', cterm = 'underline' }, --Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
  { hg = 'SpellCap', fg = colors.magneta }, --Word that should start with a capital. This will be combined with the highlighting used otherwise.
  { hg = 'SpellLocal', fg = colors.magneta }, --Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
  { hg = 'SpellRare', fg = colors.magneta }, --Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
  { hg = 'StatusLine', fg = colors.white, bg = colors.cursor_grey }, --status line of current window
  { hg = 'StatusLineNC', fg = colors.comment_grey }, --status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  { hg = 'StatusLineTerm', fg = colors.white, bg = colors.cursor_grey }, --status line of current :terminal window
  { hg = 'StatusLineTermNC', fg = colors.comment_grey }, --status line of non-current  =terminal window
  { hg = 'TabLine', fg = colors.comment_grey }, --tab pages line, not active tab page label
  { hg = 'TabLineFill' }, --tab pages line, where there are no labels
  { hg = 'TabLineSel', fg = colors.white }, --tab pages line, active tab page label
  { hg = 'Terminal', fg = colors.white, bg = colors.black }, --terminal window (see terminal-size-color)
  { hg = 'Title', fg = colors.green }, --titles for output from " =set all", ":autocmd" etc.
  { hg = 'Visual', bg = colors.visual_grey }, --Visual mode selection
  { hg = 'VisualNOS', bg = colors.visual_grey }, --Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
  { hg = 'WarningMsg', fg = colors.yellow }, --warning messages
  { hg = 'WildMenu', fg = colors.black, bg = colors.blue }, --current match in 'wildmenu' completion

  -- Diagnostics
  { hg = 'DiagnosticError', fg = colors.dark_yellow },
  { hg = 'DiagnosticWarn', fg = colors.yellow },
  { hg = 'DiagnosticInfo', fg = colors.blue },
  { hg = 'DiagnosticHint', fg = colors.cyan },
  { hg = 'DiagnosticUnderlineError', fg = colors.dark_yellow, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineWarn', fg = colors.yellow, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineInfo', fg = colors.blue, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineHint', fg = colors.cyan, gui = 'underline', cterm = 'underline' },

  -- Neovim's built-in language server client
  { hg = 'LspReferenceWrite', fg = colors.blue, gui='underline' },
  { hg = 'LspReferenceText', fg = colors.blue, gui='underline' },
  { hg = 'LspReferenceRead', fg = colors.blue, gui='underline' },
  { hg = 'LspSignatureActiveParameter', fg=colors.yellow, gui='bold' },

  -- ... an exception for my favorite plugin
  { hg = 'GitSignsAdd', fg = colors.green },
  { hg = 'GitSignsChange', fg = colors.yellow },
  { hg = 'GitSignsDelete', fg = colors.dark_yellow },

-- CSS
--  { hg ="cssAttrComma",  fg=colors.purple },
--  { hg ="cssAttributeSelector", fg=colors.green },
--  { hg ="cssBraces", fg= colors.white },
--  { hg ="cssClassName", fg= colors.magneta },
--  { hg ="cssClassNameDot", fg= colors.magneta },
--  { hg ="cssDefinition", fg= colors.purple },
--  { hg ="cssFontAttr", fg= colors.magneta },
--  { hg ="cssFontDescriptor", fg= colors.purple },
--  { hg ="cssFunctionName", fg= colors.blue },
--  { hg ="cssIdentifier", fg= colors.blue },
--  { hg ="cssImportant", fg= colors.purple },
  { hg ="cssInclude", fg= colors.white },
  { hg ="cssIncludeKeyword", fg= colors.purple },
  { hg ="cssMediaType", fg= colors.magneta },
  { hg ="cssProp", fg= colors.white },
  { hg ="cssPseudoClassId", fg= colors.magneta },
  { hg ="cssSelectorOp", fg= colors.purple },
  { hg ="cssSelectorOp2", fg= colors.purple },
  { hg ="cssTagName", fg= colors.dark_red },

-- HTML (keep consistent with Markdown, below)
  { hg ="htmlArg", fg= colors.magneta },
  { hg ="htmlBold", fg= colors.magneta, gui= "bold", cterm= "bold" },
  { hg ="htmlBoldItalic", fg= colors.green, gui= "bold,italic", cterm= "bold,italic" },
  { hg ="htmlEndTag", fg= colors.white },
  { hg ="htmlH1", fg= colors.dark_dark_yellow },
  { hg ="htmlH2", fg= colors.dark_dark_yellow },
  { hg ="htmlH3", fg= colors.dark_dark_yellow },
  { hg ="htmlH4", fg= colors.dark_dark_yellow },
  { hg ="htmlH5", fg= colors.dark_dark_yellow },
  { hg ="htmlH6", fg= colors.dark_dark_yellow },
  { hg ="htmlItalic", fg= colors.purple, gui= "italic", cterm= "italic" },
  { hg ="htmlLink", fg= colors.cyan, gui= "underline", cterm= "underline" },
  { hg ="htmlSpecialChar", fg= colors.magneta },
  { hg ="htmlSpecialTagName", fg= colors.dark_red },
  { hg ="htmlTag", fg= colors.white },
  { hg ="htmlTagN", fg= colors.dark_red },
  { hg ="htmlTagName", fg= colors.dark_red },
  { hg ="htmlTitle", fg= colors.white },

-- JavaScript
 -- { hg ="javaScriptBraces", fg= colors.white },
  --{ hg ="javaScriptFunction", fg= colors.purple },
  --{ hg ="javaScriptIdentifier", fg= colors.purple },
  --{ hg ="javaScriptNull", fg= colors.magneta },
  --{ hg ="javaScriptNumber", fg= colors.magneta },
  --{ hg ="javaScriptRequire", fg= colors.cyan },
  --{ hg ="javaScriptReserved", fg= colors.purple },

  -- typescript
	--{ hg = "typescriptTSType" , fg = colors.yellow },
  --{ hg = "typescriptTSConstructor" , fg = colors.yellow},
  --{ hg = "typescriptTSTypeBuiltin" , fg = colors.magneta},

-- JSON
  { hg ="jsonCommentError", fg= colors.white },
  { hg ="jsonKeyword", fg= colors.dark_red },
  { hg ="jsonBoolean", fg= colors.magneta },
  { hg ="jsonNumber", fg= colors.magneta },
  { hg ="jsonQuote", fg= colors.white },
  { hg ="jsonMissingCommaError", fg= colors.dark_red, gui= "reverse" },
  { hg ="jsonNoQuotesError", fg= colors.dark_red, gui= "reverse" },
  { hg ="jsonNumError", fg= colors.dark_red, gui= "reverse" },
  { hg ="jsonString", fg= colors.green },
  { hg ="jsonStringSQError", fg= colors.dark_red, gui= "reverse" },
  { hg ="jsonSemicolonError", fg= colors.dark_red, gui= "reverse" },

-- Markdown (keep consistent with HTML, above)
  { hg ="markdownBlockquote", fg= colors.comment_grey },
  { hg ="markdownBold", fg= colors.magneta, gui= "bold", cterm= "bold" },
  { hg ="markdownBoldItalic", fg= colors.green, gui= "bold,italic", cterm= "bold,italic" },
  { hg ="markdownCode", fg= colors.green },
  { hg ="markdownCodeBlock", fg= colors.green },
  { hg ="markdownCodeDelimiter", fg= colors.green },
  { hg ="markdownH1", fg= colors.dark_red },
  { hg ="markdownH2", fg= colors.dark_red },
  { hg ="markdownH3", fg= colors.dark_red },
  { hg ="markdownH4", fg= colors.dark_red },
  { hg ="markdownH5", fg= colors.dark_red },
  { hg ="markdownH6", fg= colors.dark_red },
  { hg ="markdownHeadingDelimiter", fg= colors.dark_red },
  { hg ="markdownHeadingRule", fg= colors.comment_grey },
  { hg ="markdownId", fg= colors.purple },
  { hg ="markdownIdDeclaration", fg= colors.blue },
  { hg ="markdownIdDelimiter", fg= colors.purple },
  { hg ="markdownItalic", fg= colors.purple, gui= "italic", cterm= "italic" },
  { hg ="markdownLinkDelimiter", fg= colors.purple },
  { hg ="markdownLinkText", fg= colors.blue },
  { hg ="markdownListMarker", fg= colors.dark_red },
  { hg ="markdownOrderedListMarker", fg= colors.dark_red },
  { hg ="markdownRule", fg= colors.comment_grey },
  { hg ="markdownUrl", fg= colors.cyan, gui= "underline", cterm= "underline" },

  -- Tree-sitter
  --{ hg =  "TSAnnotation " , fg = colors.dark_yellow},
  --{ hg =  "TSAttribute" , fg = colors.purple},
  --{ hg =  "TSBoolean " , fg = colors.magneta},
  --{ hg =  "TSCharacter" , fg = colors.green},
  --{ hg =  "TSComment" , fg = colors.green},
  --{ hg =  "SConditional" , fg = colors.green},
  --{ hg =  "TSNote" , fg = colors.yellow},
  --{ hg =  "TSWarning" , fg = colors.bg, bg=colors.warning},
  --{ hg =  "TSDanger" , fg = colors.bg, bg=colors.error},
  { hg =  "TSConstant " , fg = colors.white},
  --{ hg =  "commentTSConstant" , fg = colors.keyword},
  { hg =  "TSConstBuiltin" , fg = colors.magneta},
  { hg =  "TSConstMacro" , fg = colors.white},
  { hg =  "TSConstructor" , fg = colors.white},
  --{ hg =  "TSError" , fg = colors.green},
  --{ hg =  "TSException" , fg = colors.cyan},
  { hg =  "TSField" , fg = colors.white},
  --{ hg =  "TSFloat " , fg = colors.blue},
  --{ hg =  "TSFunction" , fg = colors.blue},
  { hg =  "TSFuncBuiltin" , fg = colors.magneta},
  --{ hg =  "TSFuncMacro" , fg = colors.blue},
  { hg =  "TSInclude " , fg = colors.purple},
  --{ hg =  "TSKeyword" , fg = colors.purple},
  { hg =  "TSKeywordFunction" , fg = colors.purple},
  --{ hg =  "TSKeywordOperator" , fg = colors.purple},
  --{ hg =  "TSKeywordReturn" , fg = colors.magneta},
  --{ hg =  "TSLabel" , fg = colors.purple},
  --{ hg =  "TSMethod" , fg = colors.blue},
  { hg =  "TSNamespace" , fg = colors.yellow},
  --{ hg =  "TSNone" , fg = colors.green},
  --{ hg =  "TSNumber" , fg = colors.purple},
  --{ hg =  "TSOperator" , fg = colors.foreground},
  { hg =  "TSParameter" , fg = colors.white},
  --{ hg =  "TSParameterReference" , fg = colors.dark_yellow},
  --{ hg =  "TSPreProc" , fg = colors.base00},
  --{ hg =  "TSProperty" , fg = colors.white},
  --{ hg =  "TSString" , fg = colors.green},
  --{ hg =  "TSStringRegex" , fg = colors.green},
  { hg =  "TSStringEscape" , fg = colors.yellow},
  --{ hg =  "TSStringSpecial" , fg = blue},
  --{ hg =  "TSRepeat" , fg = colors},
  --{ hg =  "TSStorageClass" , fg = colors},
  --{ hg =  "TSType " , fg = colors.yellow},
  { hg =  "TSTypeBuiltin " , fg = colors.dark_yellow},
  --{ hg =  "TSTypeDefinition" , fg = colors},
  --{ hg =  "TSTypeQualifier" , fg = colors.cyan},
  { hg =  "TSVariable" , fg = colors.magneta},
  { hg =  "TSVariableBuiltin", fg = colors.yellow},
  --{ hg =  'TSTag', fg = colors.dark_yellow},
  --{ hg =  'TSTagAttribute', fg = colors.dark_yellow},
  --{ hg =  'TSPunctDelimiter', fg = colors.white},
  { hg =  "TSTitle " , fg = colors.magneta},
  { hg =  "TSLiteral ", fg = colors.green},
  { hg =  'TSURI ', fg = colors.cyan},
  --{ hg =  'TSPunctSpecial', fg = colors.cyan},
  --{ hg =  'TSTagDelimiter', fg = colors.dark_yellow},
  --{ hg =  'TSPunctBracket', fg = colors.white},
  { hg =  'TSText', fg = colors.foreground},
  --{ hg =  'TSTextReference ', fg = colors.dark_yellow},

  --ts_rainbow
	 { hg = 'rainbowcol1', fg = colors.white, bg = colors.none },
	 { hg = 'rainbowcol2', fg = colors.yellow, bg = colors.none },
	 { hg = 'rainbowcol3', fg = colors.blue , bg = colors.none },
	 { hg = 'rainbowcol4', fg = colors.magneta, bg = colors.none },
	 { hg = 'rainbowcol5', fg = colors.purple, bg = colors.none },
	 { hg = 'rainbowcol6', fg = colors.green, bg = colors.none },
	 { hg = 'rainbowcol7', fg = colors.cyan, bg = colors.none },
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
