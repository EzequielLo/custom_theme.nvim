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
white = "#FBFBFB",
black = "#403f53", 
-- UI
background = "#FBFBFB",
foreground = "#403f53",
statusBarBackground = "#F0F0F0",
statusBarForeground = "#403f53",
bracketMatch = "#d3e8f8",
bracketMatchBorder = "#2AA298",
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
  { hg = 'String', fg = colors.StringQuoted }, --a string constant: "this is a string"
  { hg = 'Character', fg = colors.StringQuoted }, --a character constant: 'c', '\n'
  { hg = 'Number', fg = colors.number }, --a number constant: 234, 0xff
  { hg = 'Boolean', fg = colors.boolean }, --a boolean constant: TRUE, false
  { hg = 'Float', fg = colors.number }, --a floating point constant: 2.3e10
  { hg = 'Identifier', fg = colors.variable }, --any variable name
  { hg = 'Function', fg = colors.functions }, --function name (also: methods for classes)
  { hg = 'Statement', fg = colors.constant }, --any statement
  --{ hg = 'Conditional', fg = colors.keyword }, --if, then, else, endif, switch, etc.
  --{ hg = 'Repeat', fg = colors.p }, --for, do, while, etc.
  --{ hg = 'Label', fg = colors.red }, --case, default, etc.
  { hg = 'Operator', fg = colors.keyword }, --sizeof", "+", "*", etc.
  { hg = 'Keyword', fg = colors.keyword }, --any other keyword
  --{ hg = 'Exception', fg = colors.yellow }, --try, catch, throw
  --{ hg = 'PreProc', fg = colors.yellow }, --generic Preprocessor
  { hg = 'Include', fg = colors.keyword }, --preprocessor #include
  --{ hg = 'Define', fg = colors.yellow }, --preprocessor #define
  --{ hg = 'Macro', fg = colors.magneta }, --same as Define
  --{ hg = 'PreCondit', fg = colors.yellow }, --preprocessor #if, #else, #endif, etc.
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
  { hg = 'Error', fg = colors.red }, --any erroneous construct
  { hg = 'Todo', fg = colors.keyword }, --anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`) {{{
  { hg = 'ColorColumn', bg = colors.cursor_grey }, --used for the columns set with 'colorcolumn'
  { hg = 'Conceal' }, --placeholder characters substituted for concealed text (see 'conceallevel')
  { hg = 'Cursor', fg = colors.black, bg = colors.blue }, --the character under the cursor
  { hg = 'CursorIM' }, --like Cursor, but used when in IME mode
  { hg = 'CursorLine', bg = colors.cursor_grey }, --the screen line that the cursor is in when 'cursorline' is set
  { hg = 'Directory', fg = colors.blue }, --directory names (and other special names in listings)
  { hg = 'DiffAdd', bg = colors.keywordOperator, fg = colors.black }, --diff mode: Added line
  { hg = 'DiffChange', fg = colors.yellow, gui = 'underline', cterm = 'underline' }, --diff mode: Changed line
  { hg = 'DiffDelete', bg = colors.red, fg = colors.black }, --diff mode: Deleted line
  { hg = 'DiffText', bg = colors.yellow, fg = colors.black }, --diff mode: Changed text within a changed line
  { hg = 'ErrorMsg', fg = colors.red }, --error messages on the command line
  { hg = 'VertSplit', fg = colors.vertsplit }, --the column separating vertically split windows
  { hg = 'Folded', fg = colors.comment }, --line used for closed folds
  { hg = 'FoldColumn' }, --'foldcolumn'
  { hg = 'SignColumn' }, --column where signs are displayed
  { hg = 'IncSearch', fg = colors.yellow, bg = colors.comment }, --'incsearch' highlighting; also used for the text replaced with ":s///c"
  { hg = 'LineNr', fg = colors.cursor_grey }, --Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
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
  { hg = 'Question', fg = colors.keyword }, --hit-enter prompt and yes/no questions
  { hg = 'QuickFixLine', fg = colors.black, bg = colors.yellow }, --Current quickfix item in the quickfix window.
  { hg = 'Search', fg = colors.black, bg = colors.yellow }, --Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  { hg = 'SpecialKey', fg = colors.special_grey }, --Meta and special keys listed with " =map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
  { hg = 'SpellBad', fg = colors.red, gui = 'underline', cterm = 'underline' }, --Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
  { hg = 'SpellCap', fg = colors.yellow }, --Word that should start with a capital. This will be combined with the highlighting used otherwise.
  { hg = 'SpellLocal', fg = colors.yellow }, --Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
  { hg = 'SpellRare', fg = colors.yellow }, --Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
  { hg = 'StatusLine', fg = colors.white, bg = colors.black }, --status line of current window
  { hg = 'StatusLineNC', fg = colors.comment }, --status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  { hg = 'StatusLineTerm', fg = colors.white, bg = colors.black }, --status line of current :terminal window
  { hg = 'StatusLineTermNC', fg = colors.comment }, --status line of non-current  =terminal window
  { hg = 'TabLine', fg = colors.comment }, --tab pages line, not active tab page label
  { hg = 'TabLineFill' }, --tab pages line, where there are no labels
  { hg = 'TabLineSel', fg = colors.white }, --tab pages line, active tab page label
  { hg = 'Terminal', fg = colors.white, bg = colors.black }, --terminal window (see terminal-size-color)
  { hg = 'Title', fg = colors.keywordOperator }, --titles for output from " =set all", ":autocmd" etc.
  { hg = 'Visual', bg = colors.visual_grey }, --Visual mode selection
  { hg = 'VisualNOS', bg = colors.visual_grey }, --Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
  { hg = 'WarningMsg', fg = colors.yellow }, --warning messages
  { hg = 'WildMenu', fg = colors.black, bg = colors.blue }, --current match in 'wildmenu' completion

  -- Diagnostics
  { hg = 'DiagnosticError', fg = colors.red },
  { hg = 'DiagnosticWarn', fg = colors.yellow },
  { hg = 'DiagnosticInfo', fg = colors.blue },
  { hg = 'DiagnosticHint', fg = colors.cyan },
  { hg = 'DiagnosticUnderlineError', fg = colors.red, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineWarn', fg = colors.yellow, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineInfo', fg = colors.blue, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineHint', fg = colors.cyan, gui = 'underline', cterm = 'underline' },

  -- Neovim's built-in language server client
  { hg = 'LspReferenceWrite', fg = colors.blue, gui='underline' },
  { hg = 'LspReferenceText', fg = colors.blue, gui='underline' },
  { hg = 'LspReferenceRead', fg = colors.blue, gui='underline' },
  { hg = 'LspSignatureActiveParameter', fg=colors.yellow, gui='bold' },

  -- ... an exception for my favorite plugin
  { hg = 'GitSignsAdd', fg = colors.keywordOperator },
  { hg = 'GitSignsChange', fg = colors.yellow },
  { hg = 'GitSignsDelete', fg = colors.red },
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
