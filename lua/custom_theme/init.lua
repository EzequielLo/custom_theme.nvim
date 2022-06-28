local M = {}

local colors = {
comment = "#989fb1", --italic
red_1 = "#c96765",
blue= "#4876d6",
magneta = "#aa0982",  
purple = "#994cc3", --italic 
green = "#0c969b",
red_2 = "#bc5454",
blue_2 = "#78ccf0",
purple_2 = "#7986E7",
blue_3 = "#5ca7e4",
white = "#FBFBFB",
black = "#403f53", 
white = "#FBFBFB",
black = "#403f53", 
-- UI
background = "#FBFBFB",
foreground = "#403f53",
red =  "#E64D49",
yellow = "#daaa01",
cyan = "#49d0c5",
blue  = "#4876d6",
gutter_fg_grey = '#E0E0E0',
cursor_grey = '#90A7B2',
visual_grey = '#F0F0F0',
menu_grey = '#F0F0F0',
special_grey = '#403f53',
vertsplit = '#F0F0F0',
}

local highlights = {
  -- Syntax Groups (descriptions and ordering from `:h w18`)
  { hg = 'Comment', fg = colors.comment, gui = 'italic', cterm = 'italic' }, -- any comment
  { hg = 'Constant', fg = colors.constant }, --any constant
  { hg = 'String', fg = colors.red_1 }, --a red_1 constant: "this is a red_1"
  { hg = 'Character', fg = colors.red_1 }, --a character constant: 'c', '\n'
  { hg = 'Number', fg = colors.magneta }, --a magneta constant: 234, 0xff
  { hg = 'Boolean', fg = colors.red_2 }, --a red_2 constant: TRUE, false
  { hg = 'Float', fg = colors.magneta }, --a floating point constant: 2.3e10
  { hg = 'Identifier', fg = colors.foreground }, --any variable name
  { hg = 'Function', fg = colors.blue }, --function name (also: methods for classes)
  { hg = 'Statement', fg = colors.purple }, --any statement
  --{ hg = 'Conditional', fg = colors.purple }, --if, then, else, endif, switch, etc.
  --{ hg = 'Repeat', fg = colors.p }, --for, do, while, etc.
  --{ hg = 'Label', fg = colors.red }, --case, default, etc.
  --{ hg = 'Operator', fg = colors.purple }, --sizeof", "+", "*", etc.
  { hg = 'Keyword', fg = colors.purple }, --any other purple
  --{ hg = 'Exception', fg = colors.yellow }, --try, catch, throw
  --{ hg = 'PreProc', fg = colors.yellow }, --generic Preprocessor
  { hg = 'Include', fg = colors.purple }, --preprocessor #include
  --{ hg = 'Define', fg = colors.yellow }, --preprocessor #define
  --{ hg = 'Macro', fg = colors.magneta }, --same as Define
  --{ hg = 'PreCondit', fg = colors.yellow }, --preprocessor #if, #else, #endif, etc.
  { hg = 'Type', fg = colors.blue }, --int, long, char, etc.
  --{ hg = 'StorageClass', fg = colors.storage }, --static, register, volatile, etc.
  --{ hg = 'Structure', fg = colors.blue3 }, --struct, union, enum, etc.
  --{ hg = 'bluedef', fg = colors.cyan }, --A bluedef
  { hg = 'Special', fg = colors.purple }, --any special symbol
  --{ hg = 'SpecialChar', fg = colors. }, --special character in a constant
  { hg = 'Tag', fg = colors.purple}, --you can use CTRL-] on this
  { hg = 'Delimiter' }, --character that needs attention
  { hg = 'SpecialComment', fg = colors.comment }, --special things inside a comment
  { hg = 'Debug' }, --debugging statements
  { hg = 'Underlined', gui = 'underline', cterm = 'underline' }, --text that stands out, HTML links
  { hg = 'Ignore' }, --left blank, hidden
  { hg = 'Error', fg = colors.red }, --any erroneous construct
  { hg = 'Todo', fg = colors.purple }, --anything that needs extra attention; mostly the purples TODO FIXME and XXX

  -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`) {{{
  { hg = 'ColorColumn', bg = colors.cursor_grey }, --used for the columns set with 'colorcolumn'
  { hg = 'Conceal' }, --placeholder characters substituted for concealed text (see 'conceallevel')
  { hg = 'Cursor', fg = colors.black, bg = colors.cursor_grey }, --the character under the cursor
  { hg = 'CursorIM' }, --like Cursor, but used when in IME mode
  { hg = 'CursorLine', bg = colors.cursor_grey }, --the screen line that the cursor is in when 'cursorline' is set
  { hg = 'Directory', fg = colors.green }, --directory names (and other special names in listings)
  { hg = 'DiffAdd', bg = colors.purple, fg = colors.white }, --diff mode: Added line
  { hg = 'DiffChange', fg = colors.yellow, gui = 'underline', cterm = 'underline' }, --diff mode: Changed line
  { hg = 'DiffDelete', bg = colors.red, fg = colors.white }, --diff mode: Deleted line
  { hg = 'DiffText', bg = colors.yellow, fg = colors.white }, --diff mode: Changed text within a changed line
  { hg = 'ErrorMsg', fg = colors.red }, --error messages on the command line
  { hg = 'VertSplit', fg = colors.vertsplit }, --the column separating vertically split windows
  { hg = 'Folded', fg = colors.comment }, --line used for closed folds
  { hg = 'FoldColumn' }, --'foldcolumn'
  { hg = 'SignColumn' }, --column where signs are displayed
  { hg = 'IncSearch', fg = colors.yellow, bg = colors.comment }, --'incsearch' highlighting; also used for the text replaced with ":s///c"
  { hg = 'LineNr', fg = colors.cursor_grey }, --Line magneta for " =magneta" and ":#" commands, and when 'magneta' or 'relativemagneta' option is set.
  { hg = 'CursorLineNr' }, --Like LineNr when 'cursorline' or 'relativemagneta' is set for the cursor line.
  { hg = 'MatchParen', fg = colors.blue, gui = 'underline', cterm = 'underline' }, --The character under the cursor or just before it, if it is a paired bracket, and its match.
  { hg = 'ModeMsg' }, --'showmode' message (e.g., "-- INSERT --")
  { hg = 'MoreMsg' }, --more-prompt
  { hg = 'NonText', fg = colors.special_grey }, --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
  { hg = 'Normal', fg = colors.foreground, bg = colors.background }, --normal text
  { hg = 'Pmenu', fg = colors.black, bg = colors.menu_grey }, --Popup menu: normal item.
  { hg = 'PmenuSel', fg = colors.magneta, bg = colors.cursos_grey }, --Popup menu: selected item.
  { hg = 'PmenuSbar', bg = colors.cursor_grey }, --Popup menu: scrollbar.
  { hg = 'PmenuThumb', bg = colors.black }, --Popup menu: Thumb of the scrollbar.
  { hg = 'Question', fg = colors.purple }, --hit-enter prompt and yes/no questions
  { hg = 'QuickFixLine', fg = colors.black, bg = colors.yellow }, --Current quickfix item in the quickfix window.
  { hg = 'Search', fg = colors.black, bg = colors.yellow }, --Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  { hg = 'SpecialKey', fg = colors.special_grey }, --Meta and special keys listed with " =map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
  { hg = 'SpellBad', fg = colors.red, gui = 'underline', cterm = 'underline' }, --Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
  { hg = 'SpellCap', fg = colors.yellow }, --Word that should start with a capital. This will be combined with the highlighting used otherwise.
  { hg = 'SpellLocal', fg = colors.yellow }, --Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
  { hg = 'SpellRare', fg = colors.yellow }, --Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
  { hg = 'StatusLine', fg = colors.black, bg = colors.menu_grey }, --status line of current window
  { hg = 'StatusLineNC', fg = colors.comment }, --status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  { hg = 'StatusLineTerm', fg = colors.black, bg = colors.menu_grey }, --status line of current :terminal window
  { hg = 'StatusLineTermNC', fg = colors.comment }, --status line of non-current  =terminal window
  { hg = 'TabLine', fg = colors.comment }, --tab pages line, not active tab page label
  { hg = 'TabLineFill' }, --tab pages line, where there are no labels
  { hg = 'TabLineSel', fg = colors.white }, --tab pages line, active tab page label
  { hg = 'Terminal', fg = colors.white, bg = colors.black }, --terminal window (see terminal-size-color)
  { hg = 'Title', fg = colors.purple }, --titles for output from " =set all", ":autocmd" etc.
  { hg = 'Visual', bg = colors.visual_grey }, --Visual mode selection
  { hg = 'VisualNOS', bg = colors.visual_grey }, --Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
  { hg = 'WarningMsg', fg = colors.yellow }, --warning messages
  { hg = 'WildMenu', fg = colors.black, bg = colors.blue }, --current match in 'wildmenu' completion

  -- Diagnostics
  { hg = 'DiagnosticError', fg = colors.red },
  { hg = 'DiagnosticWarn', fg = colors.yellow },
  { hg = 'DiagnosticInfo', fg = colors.blue },
  { hg = 'DiagnosticHint', fg = colors.green },
  { hg = 'DiagnosticUnderlineError', fg = colors.red, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineWarn', fg = colors.yellow, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineInfo', fg = colors.blue, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineHint', fg = colors.green, gui = 'underline', cterm = 'underline' },

  -- Neovim's built-in language server client
  { hg = 'LspReferenceWrite', fg = colors.blue, gui='underline' },
  { hg = 'LspReferenceText', fg = colors.blue, gui='underline' },
  { hg = 'LspReferenceRead', fg = colors.blue, gui='underline' },
  { hg = 'LspSignatureActiveParameter', fg=colors.yellow, gui='bold' },

  -- ... an exception for my favorite plugin
  { hg = 'GitSignsAdd', fg = colors.purple },
  { hg = 'GitSignsChange', fg = colors.yellow },
  { hg = 'GitSignsDelete', fg = colors.red },

	  -- Treesitter
	--{ hg = "TSAnnotation"        , };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
  --{ hg =  "TSAttribute"         , };    -- (unstable) TODO: docs
  --{ hg =  "TSBoolean"           , };    -- For booleans.
  --{ hg =  "TSCharacter"         , };    -- For characters.
  --{ hg =  "TSComment"           , };    -- For comment blocks.
  --{ hg =  "TSNote" , fg = c.bg, bg = c.info },
  --{ hg =  "TSWarning" , fg = c.bg, bg = c.warning },
  --{ hg =  "TSDanger" , fg = c.bg, bg = c.error },
  { hg =  "TSConstructor" , fg = colors.foreground }, -- For constructor calls and definitions: `, }` in Lua, and Java constructors.
  --{ hg =  "TSConditional"       , };    -- For keywords related to conditionnals.
  { hg =  "TSConstant" , fg = colors.black }, -- For constants
  --{ hg =  "commentTSConstant" , fg = c.syntax.keyword },
  { hg =  "TSConstBuiltin",fg =colors.blue };    -- For constant that are built in the language: `nil` in Lua.
  --{ hg =  "TSConstMacro"        , };    -- For constants that are defined by macros: `NULL` in C.
  --{ hg =  "TSError"             , };    -- For syntax/parser errors.
  --{ hg =  "TSException"         , };    -- For exception related keywords.
  --{ hg =  "TSField" , fg = c.fg }, -- For fields.
  --{ hg =  "TSFloat"             , };    -- For floats.
  --{ hg =  "TSFunction"          , };    -- For function (calls and definitions).
  --{ hg =  "TSFuncBuiltin"       , };    -- For builtin functions: `table.insert` in Lua.
  --{ hg =  "TSFuncMacro"         , };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
  --{ hg =  "TSInclude" , fg = c.syntax.keyword }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
  --{ hg =  "TSKeyword" , fg = c.syntax.keyword, style = cfg.keyword_style }, -- For keywords that don't fall in previous categories.
  --{ hg =  "TSKeywordFunction" , fg = c.syntax.keyword, style = cfg.function_style }, -- For keywords used to define a fuction.
  --{ hg =   "TSLabel" , fg = c.blue }, -- For labels: `label:` in C and `:label:` in Lua.
  --{ hg =  "TSMethod"            , };    -- For method calls and definitions.
  --{ hg =  "TSNamespace" , fg = c.fg }, -- For identifiers referring to modules and namespaces.
  --{ hg =  "TSNone"              , };    -- TODO: docs
  --{ hg =  "TSNumber"            , };    -- For all numbers
  --{ hg =  "TSOperator" , fg = c.syntax.keyword }, -- For any operator: `+`, but also `->` and `*` in C.
  { hg =  "TSParameter" , fg = colors.foreground }, -- For parameters of a function.
  --{ hg =  "TSParameterReference", };    -- For references to parameters of a function.
  { hg =  "TSProperty" , fg = colors.green }, -- Same as `TSField`.
	{ hg =  "TSPunctDelimiter" , fg = colors.foreground}, -- For delimiters ie: `.`
  --{ hg =  "TSPunctBracket" , fg = c.fg }, -- For brackets and parens.
  { hg =  "TSPunctSpecial" , fg = colors.purple }, -- For special punctutation that does not fall in the catagories before.
  --{ hg =  "TSRepeat"            , };    -- For keywords related to loops.
  --{ hg =  "TSString"           , };    -- For strings.
  { hg =  "TSStringRegex" , fg = colors.blue_3 }, -- For regexes.
  --{ hg =  "TSStringEscape" , fg = c.red }, -- For escape characters within a string.
  -- TSSymbol            , };    -- For identifiers referring to symbols or atoms.
  --{ hg =  "TSType" , fg = c.syntax.keyword }, -- For types.
  --{ hg =  "TSTypeBuiltin", fg = colors.green       , };    -- For builtin types.
  { hg =  "TSVariable" , fg = colors.foreground}, -- Any variable name that does not have another highlight.
  { hg =  "TSVariableBuiltin" , fg = colors.green }, -- Variable names that are { hg =defined by the languages, like `this` or `self`.
  --{ hg =  "TSTag" , fg = c.syntax.tag }, -- Tags like html tag names.
  --{ hg =  "TSTagDelimiter" , fg = c.fg }, -- Tag delimiter like `<` `>` `/`
  --{ hg =  "TSText"              , };    -- For strings considered text in a markup language.
  --{ hg =  "TSTextReference" , fg = c.red }, -- FIXME
  --{ hg =  "TSEmphasis"          , };    -- For text to be represented with emphasis.
  --{ hg =  "TSUnderline"         , };    -- For text to be represented with an underline.
  --{ hg =  "TSStrike"            , };    -- For strikethrough text.
  --{ hg =  "TSTitle"   , }, -- Text that is part of a title.
  --{ hg =  "TSLiteral" , };    -- Literal text.
  --{ hg =  "TSURI"   , };    -- Any URI like a link or email.
    -- CSS
  --{ hg =  "cssTSProperty" , fg = c.syntax.func },
  --{ hg =  "cssTSType" , fg = c.syntax.tag },
    -- html
  --{ hg =  "htmlTSConstant" , fg = c.syntax.tag },
  --{ hg =  "htmlTag" , fg = c.fg },
  --{ hg =  "htmlEndTag" , fg = c.fg },
  --{ hg =  "htmlTagName" , fg = c.syntax.tag },
  --{ hg =  "htmlArg" , fg = c.syntax.html_arg },
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
