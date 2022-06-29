local M = {}

local colors = {
red            ="#a60000",
blue           ="#0031a9",
yellow         ="#813e00",
green          ="#005e00",
--constructor
Comment        ="#505050",
Constant       ="#0000c0" ,
Boolean        ="#005e00",
Number         ="#0000c0" ,
Float          ="#0000c0" ,
String         ="#2544bb" ,
Function       ="#721045" ,
Identifier     ="#00538b" ,
Label          ="#721045" ,
Tag            ="#721045" ,
Keyword        ="#8f0075" ,
Character      ="#005a5f" ,
Type           ="#00538b" ,
StorageClass   ="#00538b" ,
Structure      ="#00538b" ,
Typedef        ="#005a5f" ,
Conditional    ="#5317ac" ,
Statement      ="#5317ac" ,
Repeat         ="#8f0075" ,
Operator       ="#000000" ,
Exception      ="#813e00" ,
Preproc        ="#972500" ,
PreCondit      ="#972500" ,
Macro          ="#8f0075" ,
Include        ="#972500" ,
Define         ="#972500" ,
Title          ="#00538b" ,
Delimiter      ="#000000" ,
SpecialComment ="#863927",
Debug          ="#8f0075" ,
Todo           ="#70480f" ,
Warning        ="#813e00" ,
WarningMsg     ="#813e00",
Error          ="#a60000" ,
ErrorMsg       ="#a60000" ,
-- general
NormalBg       ="#ffffff" ,
NormalFg       ="#000000" ,
VisualBg       ="#000000" ,
VisualFg       ="#ffffff" ,
SearchBg       ="#f0f0f0" ,
SearchFg       ="#000000" ,
IncSearcBg     ="#505050" ,
IncSearcFg     ="#ffffff" ,
StatusLineBg   ="#000000" ,
StatusLineFg   ="#ffffff" ,
StatusLineNCBg ="#f0f0f0" ,
StatusLineNCFg ="#505050" ,
StatusLineTermBg="#005e00" ,
StatusLineTermFg="#ffffff" ,
StatusLineTermNCbg="#f0f0f0", 
StatusLineTermNcFg="#005e00" ,
VertSplit       ="NONE",
TabLineBg       ="#f0f0f0", 
TabLineFg       ="#505050",
TabLineSebg     ="#00538b", 
TabLineSefg     ="#ffffff",
TabLineFill     ="NONE", 
MatchParenBg    ="#f0f0f0", 
MatchParenFg    ="#505050",
ToolbarLineBg   ="#505050", 
ToolBarLineFg   ="#ffffff", 
ToolBarButtonBg ="#505050", 
ToolBarButtonFg ="#ffffff", 
WildMenuBg      ="#ffffff", 
WildMenuFg      ="#000000", 
LineNrBg        ="#f0f0f0", 
LineNrFg        ="#505050",
CursorBg        ="#000000", 
CursorFg        ="#ffffff", 
CursorLineBg    ="#f0f0f0", 
CursorColumnFg  ="#f0f0f0", 
CursorLineNrBg  ="#505050", 
CursorLineNrFg  ="#ffffff", 
ColorColumnBg   ="#f0f0f0", 
ColorColumnFg   ="#000000", 
SignColumnBg    ="#f0f0f0", 
SignColumnFg    ="#505050", 
FoldedBg        ="#f0f0f0", 
FoldedFg        ="#505050", 
FoldColumnBg    ="#f0f0f0", 
FoldColumnFg    ="#505050", 
SpecialFg       ="#145c33", 
SpecialKeyBg    ="#f0f0f0" ,
SpecialKeyFg    ="#505050" ,
SpecialCharFg   ="#70480f" ,
NonTextBg       ="#f0f0f0" ,
NonTextFg       ="#505050" ,
EndOfBufferFg   ="#505050" ,
DirectoryFg     ="#005e00", 
QuestionFg      ="#70480f" ,
MoreMsgFg       ="#315b00" ,
ModeMsgFg       ="#005e00" ,
IgnoreBg        ="#f0f0f0", 
IgnoreFg        ="#505050" ,
ConcealBg       ="#505050" ,
ConcealFg        ="#f0f0f0" ,
SpellBadFg      ="#a60000",  
SpellCapFg      ="#813e00" ,
SpellRareFg     ="#5317ac" ,
SpellLocalFg    ="#005a5f" ,
PmenuBg         ="#f0f0f0", 
PmenuFg         ="#000000" ,
PmenuSelBg      ="#505050" ,
PmenuSelFg      ="#ffffff" ,
PmenuSbarBg     ="#f0f0f0" ,
PmenuThumbBg    ="#505050" ,
}

local highlights = {

  -- Syntax Groups (descriptions and ordering from `:h w18`)
  { hg = 'Comment', fg = colors.comment, gui = 'italic', cterm = 'italic' }, -- any comment
  { hg = 'Constant', fg = colors.Constant }, --any constant
  { hg = 'String', fg = colors.String }, --a string constant: "this is a string"
  { hg = 'Character', fg = colors.Character }, --a character constant: 'c', '\n'
  { hg = 'Number', fg = colors.Number }, --a number constant: 234, 0xff
  { hg = 'Boolean', fg = colors.Boolean }, --a boolean constant: TRUE, false
  { hg = 'Float', fg = colors.Float }, --a floating point constant: 2.3e10
  { hg = 'Identifier', fg = colors.Identifier }, --any variable name
  { hg = 'Function', fg = colors.Function }, --function name (also: methods for classes)
  { hg = 'Statement', fg = colors.Statement }, --any statement
  { hg = 'Conditional', fg = colors.Conditional }, --if, then, else, endif, switch, etc.
  { hg = 'Repeat', fg = colors.Repeat }, --for, do, while, etc.
  { hg = 'Label', fg = colors.Label }, --case, default, etc.
  { hg = 'Operator', fg = colors.Operator }, --sizeof", "+", "*", etc.
  { hg = 'Keyword', fg = colors.Keyword }, --any other keyword
  { hg = 'Exception', fg = colors.Exception }, --try, catch, throw
  { hg = 'PreProc', fg = colors.PreProc }, --generic Preprocessor
  { hg = 'Include', fg = colors.Include }, --preprocessor #include
  { hg = 'Define', fg = colors.Define }, --preprocessor #define
  { hg = 'Macro', fg = colors.Macro }, --same as Define
  { hg = 'PreCondit', fg = colors.PreCondit }, --preprocessor #if, #else, #endif, etc.
  { hg = 'Type', fg = colors.Type }, --int, long, char, etc.
  { hg = 'StorageClass', fg = colors.StorageClass}, --static, register, volatile, etc.
  { hg = 'Structure', fg = colors.Structure }, --struct, union, enum, etc.
  { hg = 'Typedef', fg = colors.Typedef }, --A typedef
  { hg = 'Special', fg = colors.Special }, --any special symbol
  { hg = 'SpecialChar', fg = colors.SpecialChar }, --special character in a constant
  { hg = 'Tag', fg = colors.Tag }, --you can use CTRL-] on this
  { hg = 'Delimiter', fg = colors.Delimiter }, --character that needs attention
  { hg = 'SpecialComment', fg = colors.comment }, --special things inside a comment
  { hg = 'Debug', fg = colors.Debug }, --debugging statements
  { hg = 'Underlined', gui = 'underline', cterm = 'underline' }, --text that stands out, HTML links
  { hg = 'Ignore', fg = colors.Ignore }, --left blank, hidden
  { hg = 'Error', fg = colors.Error }, --any erroneous construct
  { hg = 'Todo', fg = colors.Todo }, --anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`) {{{
  { hg = 'ColorColumn', bg = colors.ColorColumnBg}, --used for the columns set with 'colorcolumn'
  { hg = 'Conceal', fg = colors.ConcealFg, bg = colors.ConcealBg }, --placeholder characters substituted for concealed text (see 'conceallevel')
  { hg = 'Cursor', fg = colors.CursorFg, bg = colors.CursorBg }, --the character under the cursor
  { hg = 'CursorIM' }, --like Cursor, but used when in IME mode
  { hg = 'CursorLine', bg = colors.CursorLineBg }, --the screen line that the cursor is in when 'cursorline' is set
  { hg = 'Directory', fg = colors.DirectoryFg }, --directory names (and other special names in listings)
  { hg = 'DiffAdd', bg = colors.green, fg = colors.black }, --diff mode: Added line
  { hg = 'DiffChange', fg = colors.yellow, gui = 'underline', cterm = 'underline' }, --diff mode: Changed line
  { hg = 'DiffDelete', bg = colors.red, fg = colors.black }, --diff mode: Deleted line
  { hg = 'DiffText', bg = colors.yellow, fg = colors.black }, --diff mode: Changed text within a changed line
  { hg = 'ErrorMsg', fg = colors.red }, --error messages on the command line
  { hg = 'VertSplit', fg = colors.VertSplit }, --the column separating vertically split windows
  { hg = 'Folded', fg = colors.FoldColumnFg }, --line used for closed folds
  { hg = 'FoldColumn' }, --'foldcolumn'
  { hg = 'SignColumn' }, --column where signs are displayed
  { hg = 'IncSearch', fg = colors.IncSearcFg, bg = colors.IncSearcBg }, --'incsearch' highlighting; also used for the text replaced with ":s///c"
  { hg = 'LineNr', fg = colors.LineNrFg }, --Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  { hg = 'CursorLineNr', fg = colors.CursorLineNrFg }, --Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
  { hg = 'MatchParen', fg = colors.MatchParenFg, gui = 'underline', cterm = 'underline' }, --The character under the cursor or just before it, if it is a paired bracket, and its match.
  { hg = 'ModeMsg' }, --'showmode' message (e.g., "-- INSERT --")
  { hg = 'MoreMsg' }, --more-prompt
  { hg = 'NonText', fg = colors.NonTextFg }, --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
  { hg = 'Normal', fg = colors.NormalFg, bg = colors.NormalBg }, --normal text
  { hg = 'Pmenu', fg = colors.PmenuFg, bg = colors.PmenuBg }, --Popup menu: normal item.
  { hg = 'PmenuSel', fg = colors.PmenuSelFg, bg = colors.PmenuSelBg }, --Popup menu: selected item.
  { hg = 'PmenuSbar', bg = colors.PmenuSbarBg }, --Popup menu: scrollbar.
  { hg = 'PmenuThumb', bg = colors.PmenuThumbBg }, --Popup menu: Thumb of the scrollbar.
  { hg = 'Question', fg = colors.QuestionFg }, --hit-enter prompt and yes/no questions
  { hg = 'QuickFixLine', fg = colors.NormalFg, bg = colors.yellow }, --Current quickfix item in the quickfix window.
  { hg = 'Search', fg = colors.SearchFg, bg = colors.SearchBg }, --Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  { hg = 'SpecialKey', fg = colors.SpecialKeyFg }, --Meta and special keys listed with " =map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
  { hg = 'SpellBad', fg = colors.SpellBadFg, gui = 'underline', cterm = 'underline' }, --Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
  { hg = 'SpellCap', fg = colors.SpellCapFg }, --Word that should start with a capital. This will be combined with the highlighting used otherwise.
  { hg = 'SpellLocal', fg = colors.SpellLocalFg }, --Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
  { hg = 'SpellRare', fg = colors.SpellRareFg }, --Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
  { hg = 'StatusLine', fg = colors.StatusLineFg, bg = colors.StatusLineBg }, --status line of current window
  { hg = 'StatusLineNC', fg = colors.StatusLineNCFg }, --status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  { hg = 'StatusLineTerm', fg = colors.StatusLineTermFg, bg = colors.StatusLineTermBg }, --status line of current :terminal window
  { hg = 'StatusLineTermNC', fg = colors.StatusLineTermNcFg }, --status line of non-current  =terminal window
  { hg = 'TabLine', fg = colors.TabLineFg }, --tab pages line, not active tab page label
  { hg = 'TabLineFill' }, --tab pages line, where there are no labels
  { hg = 'TabLineSel', fg = colors.TabLineSefg }, --tab pages line, active tab page label
  { hg = 'Terminal', fg = colors.NormalFg, bg = colors.NormalBg}, --terminal window (see terminal-size-color)
  { hg = 'Title', fg = colors.Title}, --titles for output from " =set all", ":autocmd" etc.
  { hg = 'Visual', bg = colors.VisualBg, fg=colors.VisualFg }, --Visual mode selection
  { hg = 'VisualNOS'}, --Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
  { hg = 'WarningMsg', fg = colors.WarningMsg }, --warning messages
  { hg = 'WildMenu', fg = colors.WildMenuFg, bg = colors.WildMenuBg }, --current match in 'wildmenu' completion

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
  { hg = 'GitSignsAdd', fg = colors.green },
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
