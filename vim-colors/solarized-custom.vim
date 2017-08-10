" vi:syntax=vim

" base16-vim (https://github.com/chriskempson/base16-vim)
" by Chris Kempson (http://chriskempson.com)
" Solarized Dark scheme by Ethan Schoonover (http://ethanschoonover.com/solarized)

" This enables the coresponding base16-shell script to run so that
" :colorscheme works in terminals supported by base16-shell scripts
" User must set this variable in .vimrc
"   let g:base16_shell_path=base16-builder/output/shell/
if !has('gui_running')
  if exists("g:base16_shell_path")
    execute "silent !/bin/sh ".g:base16_shell_path."/base16-solarized-dark.sh"
  endif
endif

" GUI color definitions
let s:darkGreen = "001E28"
let s:accentDarkGreen = "0D2B35"
let s:darkGray = "555555"
let s:mediumGray = "6F6F6F"
let s:mediumLightGray = "888888"
let s:lightGray = "A2A2A2"
let s:veryLightGray = "bbbbbb"
let s:almostWhite = "dddddd"
let s:paperWhite = "eee8d5"
let s:pink = "f92672"
let s:burntOrange = "cb4b16"
let s:orange = "DF8411"
let s:mustardYellow = "b58900"
let s:neonGreen = "7FC70B"
let s:green = "65AD00"
let s:cyan = "2aa198"
let s:neonCyan = "2DFFFE"
let s:neonYellow = "ECFE08"
let s:magenta = "d33682"
let s:purple = "AE81FF"
let s:neonOrange = "F89D2A"

" Unused colors
let s:gui07 = "fdf6e3"

" Terminal color definitions
let s:cterm00 = "00"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
if exists('base16colorspace') && base16colorspace == "256"
  let s:cterm01 = "18"
  let s:cterm02 = "19"
  let s:cterm04 = "20"
  let s:cterm06 = "21"
  let s:cterm09 = "16"
  let s:cterm0F = "17"
else
  let s:cterm01 = "10"
  let s:cterm02 = "11"
  let s:cterm04 = "12"
  let s:cterm06 = "13"
  let s:cterm09 = "09"
  let s:cterm0F = "14"
endif

" Neovim terminal colours
if has("nvim")
  let g:terminal_color_0 =  "#002b36"
  let g:terminal_color_1 =  "#dc322f"
  let g:terminal_color_2 =  "#859900"
  let g:terminal_color_3 =  "#b58900"
  let g:terminal_color_4 =  "#268bd2"
  let g:terminal_color_5 =  "#6c71c4"
  let g:terminal_color_6 =  "#2aa198"
  let g:terminal_color_7 =  "#93a1a1"
  let g:terminal_color_8 =  "#657b83"
  let g:terminal_color_9 =  "#cb4b16"
  let g:terminal_color_10 = "#073642"
  let g:terminal_color_11 = "#586e75"
  let g:terminal_color_12 = "#839496"
  let g:terminal_color_13 = "#eee8d5"
  let g:terminal_color_14 = "#d33682"
  let g:terminal_color_15 = "#fdf6e3"
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_7
  if &background == "light"
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
  endif
endif

" Theme setup
hi clear
syntax reset
let g:colors_name = "solarized-custom"

" Highlighting function
fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=#" . a:guisp
  endif
endfun

" Vim editor colors
call <sid>hi("Normal",        s:almostWhite, s:darkGreen, s:cterm05, s:cterm00, "", "")
call <sid>hi("Bold",          "", "", "", "", "bold", "")
call <sid>hi("Debug",         s:pink, "", s:cterm08, "", "", "")
call <sid>hi("Directory",     s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("Error",         s:darkGreen, s:pink, s:cterm00, s:cterm08, "", "")
call <sid>hi("ErrorMsg",      s:pink, s:darkGreen, s:cterm08, s:cterm00, "", "")
call <sid>hi("Exception",     s:pink, "", s:cterm08, "", "", "")
call <sid>hi("FoldColumn",    s:cyan, s:accentDarkGreen, s:cterm0C, s:cterm01, "", "")
call <sid>hi("Folded",        s:mediumLightGray, s:accentDarkGreen, s:cterm03, s:cterm01, "", "")
call <sid>hi("IncSearch",     s:accentDarkGreen, s:lightGray, s:cterm01, s:cterm09, "none", "")
call <sid>hi("Italic",        "", "", "", "", "none", "")
call <sid>hi("Macro",         s:pink, "", s:cterm08, "", "", "")
call <sid>hi("MatchParen",    "", s:mediumLightGray, "", s:cterm03,  "", "")
call <sid>hi("ModeMsg",       s:neonGreen, "", s:cterm0B, "", "", "")
call <sid>hi("MoreMsg",       s:neonGreen, "", s:cterm0B, "", "", "")
call <sid>hi("Question",      s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("Search",        s:accentDarkGreen, s:mediumLightGray, s:cterm03, s:cterm0A,  "", "")
call <sid>hi("SpecialKey",    s:mediumLightGray, "", s:cterm03, "", "", "")
call <sid>hi("TooLong",       s:pink, "", s:cterm08, "", "", "")
call <sid>hi("Underlined",    s:pink, "", s:cterm08, "", "", "")
call <sid>hi("Visual",        "", s:mediumGray, "", s:cterm02, "", "")
call <sid>hi("VisualNOS",     s:pink, "", s:cterm08, "", "", "")
call <sid>hi("WarningMsg",    s:pink, "", s:cterm08, "", "", "")
call <sid>hi("WildMenu",      s:almostWhite, s:mediumGray, s:cterm08, "", "", "")
call <sid>hi("Title",         s:neonCyan, "", s:cterm0D, "", "none", "")
call <sid>hi("Conceal",       s:neonCyan, s:darkGreen, s:cterm0D, s:cterm00, "", "")
call <sid>hi("Cursor",        s:darkGreen, s:almostWhite, s:cterm00, s:cterm05, "", "")
call <sid>hi("NonText",       s:mediumLightGray, "", s:cterm03, "", "", "")
call <sid>hi("LineNr",        s:mediumLightGray, s:accentDarkGreen, s:cterm03, s:cterm01, "", "")
call <sid>hi("SignColumn",    s:mediumLightGray, s:accentDarkGreen, s:cterm03, s:cterm01, "", "")
call <sid>hi("StatusLine",    s:lightGray, s:mediumGray, s:cterm04, s:cterm02, "none", "")
call <sid>hi("StatusLineNC",  s:mediumLightGray, s:accentDarkGreen, s:cterm03, s:cterm01, "none", "")
call <sid>hi("VertSplit",     s:mediumGray, s:mediumGray, s:cterm02, s:cterm02, "none", "")
call <sid>hi("ColorColumn",   "", s:accentDarkGreen, "", s:cterm01, "none", "")
call <sid>hi("CursorColumn",  "", s:accentDarkGreen, "", s:cterm01, "none", "")
call <sid>hi("CursorLine",    "", s:accentDarkGreen, "", s:cterm01, "none", "")
call <sid>hi("CursorLineNr",  s:lightGray, s:accentDarkGreen, s:cterm04, s:cterm01, "", "")
call <sid>hi("QuickFixLine",  "", s:accentDarkGreen, "", s:cterm01, "none", "")
call <sid>hi("PMenu",         s:almostWhite, s:accentDarkGreen, s:cterm05, s:cterm01, "none", "")
call <sid>hi("PMenuSel",      s:accentDarkGreen, s:almostWhite, s:cterm01, s:cterm05, "", "")
call <sid>hi("TabLine",       s:mediumLightGray, s:accentDarkGreen, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineFill",   s:mediumLightGray, s:accentDarkGreen, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineSel",    s:neonGreen, s:accentDarkGreen, s:cterm0B, s:cterm01, "none", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:neonOrange, "", s:cterm09, "", "", "")
call <sid>hi("Character",    s:pink, "", s:cterm08, "", "", "")
call <sid>hi("Comment",      s:darkGray, "", s:cterm03, "", "", "")
call <sid>hi("Conditional",  s:purple, "", s:cterm0E, "", "", "")
call <sid>hi("Constant",     s:burntOrange, "", s:cterm09, "", "", "")
call <sid>hi("Define",       s:neonYellow, "", s:cterm0E, "", "none", "")
call <sid>hi("Delimiter",    s:magenta, "", s:cterm0F, "", "", "")
call <sid>hi("Float",        s:burntOrange, "", s:cterm09, "", "", "")
call <sid>hi("Function",     s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("Identifier",   s:pink, "", s:cterm08, "", "none", "")
call <sid>hi("Include",      s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("Keyword",      s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("Label",        s:veryLightGray, "", s:cterm0A, "", "", "")
call <sid>hi("Number",       s:neonOrange, "", s:cterm09, "", "", "")
call <sid>hi("Operator",     s:almostWhite, "", s:cterm05, "", "none", "")
call <sid>hi("PreProc",      s:mustardYellow, "", s:cterm0A, "", "", "")
call <sid>hi("Repeat",       s:mustardYellow, "", s:cterm0A, "", "", "")
call <sid>hi("Special",      s:mediumGray, "", s:cterm0C, "", "", "")
call <sid>hi("SpecialChar",  s:magenta, "", s:cterm0F, "", "", "")
call <sid>hi("Statement",    s:pink, "", s:cterm08, "", "", "")
call <sid>hi("StorageClass", s:neonYellow, "", s:cterm0A, "", "", "")
call <sid>hi("String",       s:neonGreen, "", s:cterm0B, "", "", "")
call <sid>hi("Structure",    s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("Tag",          s:mustardYellow, "", s:cterm0A, "", "", "")
call <sid>hi("Todo",         s:mustardYellow, s:darkGreen, s:cterm0A, s:cterm01, "bold", "")
call <sid>hi("Type",         s:lightGray, "", s:cterm0A, "", "none", "")
call <sid>hi("Typedef",      s:mustardYellow, "", s:cterm0A, "", "", "")

" C highlighting
call <sid>hi("cOperator",   s:cyan, "", s:cterm0C, "", "", "")
call <sid>hi("cPreCondit",  s:neonYellow, "", s:cterm0E, "", "", "")

" C# highlighting
call <sid>hi("csClass",                 s:mustardYellow, "", s:cterm0A, "", "", "")
call <sid>hi("csAttribute",             s:mustardYellow, "", s:cterm0A, "", "", "")
call <sid>hi("csModifier",              s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("csType",                  s:pink, "", s:cterm08, "", "", "")
call <sid>hi("csUnspecifiedStatement",  s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("csContextualStatement",   s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("csNewDecleration",        s:pink, "", s:cterm08, "", "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:almostWhite, "", s:cterm05, "", "", "")
call <sid>hi("cssClassName",   s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("cssColor",       s:cyan, "", s:cterm0C, "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:neonGreen, s:accentDarkGreen,  s:cterm0B, s:cterm01, "", "")
call <sid>hi("DiffChange",   s:mediumLightGray, s:accentDarkGreen,  s:cterm03, s:cterm01, "", "")
call <sid>hi("DiffDelete",   s:pink, s:accentDarkGreen,  s:cterm08, s:cterm01, "", "")
call <sid>hi("DiffText",     s:neonCyan, s:accentDarkGreen,  s:cterm0D, s:cterm01, "", "")
call <sid>hi("DiffAdded",    s:neonGreen, s:darkGreen,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffFile",     s:pink, s:darkGreen,  s:cterm08, s:cterm00, "", "")
call <sid>hi("DiffNewFile",  s:neonGreen, s:darkGreen,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffLine",     s:neonCyan, s:darkGreen,  s:cterm0D, s:cterm00, "", "")
call <sid>hi("DiffRemoved",  s:pink, s:darkGreen,  s:cterm08, s:cterm00, "", "")

" Git highlighting
call <sid>hi("gitcommitOverflow",       s:pink, "", s:cterm08, "", "", "")
call <sid>hi("gitcommitSummary",        s:neonGreen, "", s:cterm0B, "", "", "")
call <sid>hi("gitcommitComment",        s:mediumLightGray, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitUntracked",      s:mediumLightGray, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitDiscarded",      s:mediumLightGray, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitSelected",       s:mediumLightGray, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitHeader",         s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("gitcommitSelectedType",   s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitUnmergedType",   s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitDiscardedType",  s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitBranch",         s:burntOrange, "", s:cterm09, "", "bold", "")
call <sid>hi("gitcommitUntrackedFile",  s:mustardYellow, "", s:cterm0A, "", "", "")
call <sid>hi("gitcommitUnmergedFile",   s:pink, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitDiscardedFile",  s:pink, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitSelectedFile",   s:neonGreen, "", s:cterm0B, "", "bold", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:neonGreen, s:accentDarkGreen, s:cterm0B, s:cterm01, "", "")
call <sid>hi("GitGutterChange",  s:neonCyan, s:accentDarkGreen, s:cterm0D, s:cterm01, "", "")
call <sid>hi("GitGutterDelete",  s:pink, s:accentDarkGreen, s:cterm08, s:cterm01, "", "")
call <sid>hi("GitGutterChangeDelete",  s:neonYellow, s:accentDarkGreen, s:cterm0E, s:cterm01, "", "")

" HTML highlighting
call <sid>hi("htmlBold",    s:mustardYellow, "", s:cterm0A, "", "", "")
call <sid>hi("htmlItalic",  s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("htmlEndTag",  s:almostWhite, "", s:cterm05, "", "", "")
call <sid>hi("htmlTag",     s:almostWhite, "", s:cterm05, "", "", "")

" JavaScript highlighting
call <sid>hi("javaScript",        s:almostWhite, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptBraces",  s:almostWhite, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptNumber",  s:pink, "", s:cterm09, "", "", "")
" pangloss/vim-javascript highlighting
call <sid>hi("jsOperator",          s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("jsStatement",         s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("jsReturn",            s:purple, "", s:cterm0E, "", "", "")
call <sid>hi("jsThis",              s:magenta, "", s:cterm08, "", "", "")
call <sid>hi("jsClassDefinition",   s:neonOrange, "", s:cterm0A, "", "bold", "")
call <sid>hi("jsFunction",          s:neonCyan, "", s:cterm0E, "", "", "")
call <sid>hi("jsFuncName",          s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("jsFuncCall",          s:cyan, "", s:cterm0D, "", "", "")
call <sid>hi("jsClassFuncName",     s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("jsClassMethodType",   s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("jsRegexpString",      s:cyan, "", s:cterm0C, "", "", "")
call <sid>hi("jsGlobalObjects",     s:magenta, "", s:cterm0A, "", "", "")
call <sid>hi("jsGlobalNodeObjects", s:mustardYellow, "", s:cterm0A, "", "", "")
call <sid>hi("jsExceptions",        s:neonOrange, "", s:cterm0A, "", "", "")
call <sid>hi("jsBuiltins",          s:purple, "", s:cterm0A, "", "", "")

" Handlebars highlighting
call <sid>hi("hbsHandles",  s:cyan, "", s:cterm0A, "", "", "")
call <sid>hi("hbsIdentifier",  s:paperWhite, "", s:cterm0A, "", "", "")
call <sid>hi("hbsString",  s:neonGreen, "", s:cterm0A, "", "", "")
call <sid>hi("hbsMustacheName",  s:orange, "", s:cterm0A, "", "", "")
call <sid>hi("hbsPencilName",  s:cyan, "", s:cterm0A, "", "", "")
call <sid>hi("hbsBuiltInHelper",  s:purple, "", s:cterm0A, "", "", "")
call <sid>hi("hbsKeyword",  s:purple, "", s:cterm0A, "", "", "")
call <sid>hi("hbsArg",  s:orange, "", s:cterm0A, "", "", "")

" Mail highlighting
call <sid>hi("mailQuoted1",  s:mustardYellow, "", s:cterm0A, "", "", "")
call <sid>hi("mailQuoted2",  s:neonGreen, "", s:cterm0B, "", "", "")
call <sid>hi("mailQuoted3",  s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("mailQuoted4",  s:cyan, "", s:cterm0C, "", "", "")
call <sid>hi("mailQuoted5",  s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("mailQuoted6",  s:mustardYellow, "", s:cterm0A, "", "", "")
call <sid>hi("mailURL",      s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("mailEmail",    s:neonCyan, "", s:cterm0D, "", "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:neonGreen, "", s:cterm0B, "", "", "")
call <sid>hi("markdownError",             s:almostWhite, s:darkGreen, s:cterm05, s:cterm00, "", "")
call <sid>hi("markdownCodeBlock",         s:neonGreen, "", s:cterm0B, "", "", "")
call <sid>hi("markdownHeadingDelimiter",  s:neonCyan, "", s:cterm0D, "", "", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("NERDTreeExecFile",  s:almostWhite, "", s:cterm05, "", "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:almostWhite, "", s:cterm05, "", "", "")
call <sid>hi("phpComparison",      s:almostWhite, "", s:cterm05, "", "", "")
call <sid>hi("phpParent",          s:almostWhite, "", s:cterm05, "", "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("pythonRepeat",    s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("pythonInclude",   s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("pythonStatement", s:neonYellow, "", s:cterm0E, "", "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:neonCyan, "", s:cterm0D, "", "", "")
call <sid>hi("rubyConstant",                s:mustardYellow, "", s:cterm0A, "", "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:magenta, "", s:cterm0F, "", "", "")
call <sid>hi("rubyRegexp",                  s:cyan, "", s:cterm0C, "", "", "")
call <sid>hi("rubySymbol",                  s:neonGreen, "", s:cterm0B, "", "", "")
call <sid>hi("rubyStringDelimiter",         s:neonGreen, "", s:cterm0B, "", "", "")

" SASS highlighting
call <sid>hi("sassidChar",     s:pink, "", s:cterm08, "", "", "")
call <sid>hi("sassClassChar",  s:burntOrange, "", s:cterm09, "", "", "")
call <sid>hi("sassInclude",    s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("sassMixing",     s:neonYellow, "", s:cterm0E, "", "", "")
call <sid>hi("sassMixinName",  s:neonCyan, "", s:cterm0D, "", "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:neonGreen, s:accentDarkGreen, s:cterm0B, s:cterm01, "", "")
call <sid>hi("SignifySignChange",  s:neonCyan, s:accentDarkGreen, s:cterm0D, s:cterm01, "", "")
call <sid>hi("SignifySignDelete",  s:pink, s:accentDarkGreen, s:cterm08, s:cterm01, "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", s:darkGreen, "", s:cterm00, "undercurl", s:pink)
call <sid>hi("SpellLocal",   "", s:darkGreen, "", s:cterm00, "undercurl", s:cyan)
call <sid>hi("SpellCap",     "", s:darkGreen, "", s:cterm00, "undercurl", s:neonCyan)
call <sid>hi("SpellRare",    "", s:darkGreen, "", s:cterm00, "undercurl", s:neonYellow)

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:darkGreen s:accentDarkGreen s:mediumGray s:mediumLightGray  s:lightGray  s:almostWhite  s:paperWhite  s:gui07  s:pink  s:burntOrange s:mustardYellow  s:neonGreen  s:cyan  s:neonCyan  s:neonYellow  s:magenta s:purple s:neonOrange
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
