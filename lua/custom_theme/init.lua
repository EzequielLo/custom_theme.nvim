local M = {}

local colors = {
comment = "#989fb1", --italic
string = "#4876d6", --italic
StringQuoted = "#c96765",
constantMath = "#4876d6",
number = "#aa0982",
builtInConstant = "#4876d6",
ConstantCharacterEscape = "#aa0982",
RegExpString = "#5ca7e4", 
variable = "#4876d6", 
keyword = "#994cc3", --italic 
KeywordOperator = "#0c969b",
storage = "#994cc3", --italic
Storagetype = "#994cc3", 
FunctionName = "#994cc3", --italic
tag = "#994cc3",
tagAttribute = "#4876d6", -- italic
functions =  "#4876d6",
constant = "#4876d6",
property = "#0c969b",
type = "#4876d6",
boolean = "#bc5454",
variableParameterFunction = "#0c969b",
method = "#4876d6",
othervariables = "#78ccf0",
Parameter = "#7986E7",
-- Git
changed = "#a2bffc",
deleted = "#EF535090",
added = "#4876d6ff",
-- UI
background = "#FBFBFB",
foreground = "#403f53",
error = "#ff2c83",
statusBarBackground" = "#F0F0F0",
statusBarForeground" = "#403f53",
}

local highlights = {
  -- Syntax Groups (descriptions and ordering from `:h w18`)
  { hg = 'Comment', fg = colors.comment, gui = 'italic', cterm = 'italic' }, -- any comment
  { hg = 'Constant', fg = colors.constant }, --any constant
  { hg = 'String', fg = colors.StringQuoted }, --a string constant: "this is a string"
  { hg = 'Character', fg = colors.StringQuoted }, --a character constant: 'c', '\n'
  { hg = 'Number', fg = colors.number }, --a number constant: 234, 0xff
  { hg = 'Boolean', fg = colors.boolean }, --a boolean constant: TRUE, false
  { hg = 'Float', fg = colors.number }, --a floating point constant: 2.3e10
  { hg = 'Identifier', fg = colors.variable }, --any variable name
  { hg = 'Function', fg = colors.functions }, --function name (also: methods for classes)
  { hg = 'Statement', fg = colors.constant }, --any statement
  --{ hg = 'Conditional', fg = colors.purple }, --if, then, else, endif, switch, etc.
  --{ hg = 'Repeat', fg = colors.p }, --for, do, while, etc.
  --{ hg = 'Label', fg = colors.red }, --case, default, etc.
  { hg = 'Operator', fg = colors.keyword }, --sizeof", "+", "*", etc.
  { hg = 'Keyword', fg = colors.keyword }, --any other keyword
  --{ hg = 'Exception', fg = colors.yellow }, --try, catch, throw
  --{ hg = 'PreProc', fg = colors.dark_yellow }, --generic Preprocessor
  { hg = 'Include', fg = colors.keyword }, --preprocessor #include
  --{ hg = 'Define', fg = colors.dark_yellow }, --preprocessor #define
  --{ hg = 'Macro', fg = colors.magneta }, --same as Define
  --{ hg = 'PreCondit', fg = colors.dark_yellow }, --preprocessor #if, #else, #endif, etc.
  { hg = 'Type', fg = colors.type }, --int, long, char, etc.
  --{ hg = 'StorageClass', fg = colors.storage }, --static, register, volatile, etc.
  --{ hg = 'Structure', fg = colors.blue3 }, --struct, union, enum, etc.
  --{ hg = 'Typedef', fg = colors.cyan }, --A typedef
  { hg = 'Special', fg = colors.foreground }, --any special symbol
  --{ hg = 'SpecialChar', fg = colors. }, --special character in a constant
  { hg = 'Tag', fg = colors.tag }, --you can use CTRL-] on this
  { hg = 'Delimiter' }, --character that needs attention
  { hg = 'SpecialComment', fg = colors.comment }, --special things inside a comment
  { hg = 'Debug' }, --debugging statements
  { hg = 'Underlined', gui = 'underline', cterm = 'underline' }, --text that stands out, HTML links
  { hg = 'Ignore' }, --left blank, hidden
  { hg = 'Error', fg = colors.error }, --any erroneous construct
  --{ hg = 'Todo', fg = colors.purple }, --anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`) {{{
  { hg = 'ColorColumn'}, --used for the columns set with 'colorcolumn'
  { hg = 'Conceal' }, --placeholder characters substituted for concealed text (see 'conceallevel')
  { hg = 'Cursor'}, --the character under the cursor
  { hg = 'CursorIM' }, --like Cursor, but used when in IME mode
  { hg = 'CursorLine'}, --the screen line that the cursor is in when 'cursorline' is set
  { hg = 'Directory'}, --directory names (and other special names in listings)
  { hg = 'DiffAdd'}, --diff mode: Added line
  { hg = 'DiffChange', gui = 'underline', cterm = 'underline' }, --diff mode: Changed line
  { hg = 'DiffDelete'}, --diff mode: Deleted line
  { hg = 'DiffText'}, --diff mode: Changed text within a changed line
  { hg = 'ErrorMsg'}, --error messages on the command line
  { hg = 'VertSplit'}, --the column separating vertically split windows
  { hg = 'Folded'}, --line used for closed folds
  { hg = 'FoldColumn' }, --'foldcolumn'
  { hg = 'SignColumn' }, --column where signs are displayed
  { hg = 'IncSearch'}, --'incsearch' highlighting; also used for the text replaced with ":s///c"
  { hg = 'LineNr'}, --Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  { hg = 'CursorLineNr' }, --Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
  { hg = 'MatchParen', gui = 'underline', cterm = 'underline' }, --The character under the cursor or just before it, if it is a paired bracket, and its match.
  { hg = 'ModeMsg' }, --'showmode' message (e.g., "-- INSERT --")
  { hg = 'MoreMsg' }, --more-prompt
  { hg = 'NonText'}, --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
  { hg = 'Normal', fg = colors.foreground, bg = colors.background }, --normal text
  { hg = 'Pmenu', }, --Popup menu: normal item.
  { hg = 'PmenuSel'}, --Popup menu: selected item.
  { hg = 'PmenuSbar'}, --Popup menu: scrollbar.
  { hg = 'PmenuThumb'}, --Popup menu: Thumb of the scrollbar.
  { hg = 'Question'}, --hit-enter prompt and yes/no questions
  { hg = 'QuickFixLine' }, --Current quickfix item in the quickfix window.
  { hg = 'Search'}, --Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  { hg = 'SpecialKey'}, --Meta and special keys listed with " =map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
  { hg = 'SpellBad',gui = 'underline', cterm = 'underline' }, --Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
  { hg = 'SpellCap'}, --Word that should start with a capital. This will be combined with the highlighting used otherwise.
  { hg = 'SpellLocal'}, --Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
  { hg = 'SpellRare', fg = colors.dark_yellow }, --Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
  { hg = 'StatusLine', fg= colors.statusBarForeground, bg = colors.statusBarBackground}, --status line of current window
  { hg = 'StatusLineNC'}, --status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  { hg = 'StatusLineTerm'}, --status line of current :terminal window
  { hg = 'StatusLineTermNC'}, --status line of non-current  =terminal window
  { hg = 'TabLine', fg = colors.comment }, --tab pages line, not active tab page label
  { hg = 'TabLineFill' }, --tab pages line, where there are no labels
  { hg = 'TabLineSel'}, --tab pages line, active tab page label
  { hg = 'Terminal'}, --terminal window (see terminal-size-color)
  { hg = 'Title'}, --titles for output from " =set all", ":autocmd" etc.
  { hg = 'Visual'}, --Visual mode selection
  { hg = 'VisualNOS'}, --Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
  { hg = 'WarningMsg'}, --warning messages
  { hg = 'WildMenu'}, --current match in 'wildmenu' completion

  -- Diagnostics
--  { hg = 'DiagnosticError', fg = colors.error },
--  { hg = 'DiagnosticWarn', fg = colors.warning },
--  { hg = 'DiagnosticInfo', fg = colors.note },
--  { hg = 'DiagnosticHint', fg = colors.cyan },
--  { hg = 'DiagnosticUnderlineError', fg = colors.error, gui = 'underline', cterm = 'underline' },
--  { hg = 'DiagnosticUnderlineWarn', fg = colors.warning, gui = 'underline', cterm = 'underline' },
--  { hg = 'DiagnosticUnderlineInfo', fg = colors.note, gui = 'underline', cterm = 'underline' },
--  { hg = 'DiagnosticUnderlineHint', fg = colors.cyan, gui = 'underline', cterm = 'underline' },

  -- Neovim's built-in language server client
--  { hg = 'LspReferenceWrite', fg = colors.blue, gui='underline' },
--  { hg = 'LspReferenceText', fg = colors.blue, gui='underline' },
--  { hg = 'LspReferenceRead', fg = colors.blue, gui='underline' },
--  { hg = 'LspSignatureActiveParameter', fg=colors.yellow, gui='bold' },

  -- ... an exception for my favorite plugin
--  { hg = 'GitSignsAdd', fg = colors.added },
--  { hg = 'GitSignsChange', fg = colors.changed },
--  { hg = 'GitSignsDelete', fg = colors.Deleted },

--  { hg = 'TSConstructor', fg = colors.green },
--	{ hg = 'TSProperty', fg = colors.blue },
--  { hg = 'TSTypebuiltin', fg = colors.purple }, 
--  { hg = 'TSVariableBuilt', fg = colors.blue },
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
