" vi:syntax=vim

" GUI color definitions
let s:base = "051722"
let s:base1 = "0A1C27"
let s:base2 = "073642"
let s:base3 = "586e75"
let s:base4 = "657b83"
let s:base5 = "839496"
let s:base6 = "93a1a1"
let s:base7 = "e1dbc8"
let s:base8 = "fdf6e3"
let s:yellow = "b58900"
let s:orange = "cb4b16"
let s:red = "dc322f"
let s:green = "859900"
let s:cyan = "2aa198"
let s:blue = "268bd2"
let s:violet = "6c71c4"
let s:magenta = "d33682"

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
let g:colors_name = "base16-solarized-dark"

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
call <sid>hi("Bold",          "", "", "", "", "bold", "")
call <sid>hi("ColorColumn",   "", s:base1, "", s:cterm01, "none", "")
call <sid>hi("Conceal",       s:blue, s:base, s:cterm0D, s:cterm00, "", "")
call <sid>hi("Cursor",        s:base, s:base6, s:cterm00, s:cterm05, "", "")
call <sid>hi("CursorColumn",  "", s:base1, "", s:cterm01, "none", "")
call <sid>hi("CursorLine",    "", s:base1, "", s:cterm01, "none", "")
call <sid>hi("CursorLineNr",  s:base5, s:base1, s:cterm04, s:cterm01, "", "")
call <sid>hi("Debug",         s:red, "", s:cterm08, "", "", "")
call <sid>hi("Directory",     s:cyan, "", s:cterm0D, "", "", "")
call <sid>hi("Error",         s:red, s:base, s:cterm00, s:cterm08, "", "")
call <sid>hi("ErrorMsg",      s:red, s:base, s:cterm08, s:cterm00, "", "")
call <sid>hi("Exception",     s:orange, "", s:cterm08, "", "", "")
call <sid>hi("FoldColumn",    s:cyan, s:base2, s:cterm0C, s:cterm01, "", "")
call <sid>hi("Folded",        s:base4, s:base2, s:cterm03, s:cterm01, "", "")
call <sid>hi("IncSearch",     s:base8, s:base3, s:cterm01, s:cterm09, "none", "")
call <sid>hi("Italic",        "", "", "", "", "none", "")
call <sid>hi("LineNr",        s:base4, s:base1, s:cterm03, s:cterm01, "", "")
call <sid>hi("Macro",         s:red, "", s:cterm08, "", "", "")
call <sid>hi("MatchParen",    "", s:base4, "", s:cterm03,  "", "")
call <sid>hi("ModeMsg",       s:green, "", s:cterm0B, "", "", "")
call <sid>hi("MoreMsg",       s:green, "", s:cterm0B, "", "", "")
call <sid>hi("NonText",       s:base4, "", s:cterm03, "", "", "")
call <sid>hi("Normal",        s:base7, s:base, s:cterm05, s:cterm00, "", "")
call <sid>hi("PMenu",         s:base6, s:base2, s:cterm05, s:cterm01, "none", "")
call <sid>hi("PMenuSel",      s:base2, s:base6, s:cterm01, s:cterm05, "", "")
call <sid>hi("Question",      s:blue, "", s:cterm0D, "", "", "")
call <sid>hi("QuickFixLine",  "", s:base2, "", s:cterm01, "none", "")
call <sid>hi("Search",        s:base8, s:base4, s:cterm03, s:cterm0A,  "", "")
call <sid>hi("SignColumn",    s:base4, s:base1, s:cterm03, s:cterm01, "", "")
call <sid>hi("SpecialKey",    s:base4, "", s:cterm03, "", "", "")
call <sid>hi("StatusLine",    s:base5, s:base3, s:cterm04, s:cterm02, "none", "")
call <sid>hi("StatusLineNC",  s:base4, s:base2, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLine",       s:base4, s:base2, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineFill",   s:base4, s:base2, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineSel",    s:green, s:base2, s:cterm0B, s:cterm01, "none", "")
call <sid>hi("Title",         s:blue, "", s:cterm0D, "", "none", "")
call <sid>hi("TooLong",       s:red, "", s:cterm08, "", "", "")
call <sid>hi("Underlined",    s:red, "", s:cterm08, "", "", "")
call <sid>hi("VertSplit",     s:base6, s:base4, s:cterm02, s:cterm02, "none", "")
call <sid>hi("Visual",        "", s:base2, "", s:cterm02, "", "")
call <sid>hi("VisualNOS",     s:red, "", s:cterm08, "", "", "")
call <sid>hi("WarningMsg",    s:yellow, "", s:cterm08, "", "", "")
call <sid>hi("WildMenu",      s:base3, s:base8, s:cterm08, "", "", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:magenta, "", s:cterm09, "", "", "")
call <sid>hi("Character",    s:red, "", s:cterm08, "", "", "")
call <sid>hi("Comment",      s:base3, "", s:cterm03, "", "", "")
call <sid>hi("Conditional",  s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("Constant",     s:orange, "", s:cterm09, "", "", "")
call <sid>hi("Define",       s:violet, "", s:cterm0E, "", "none", "")
call <sid>hi("Delimiter",    s:magenta, "", s:cterm0F, "", "", "")
call <sid>hi("Float",        s:orange, "", s:cterm09, "", "", "")
call <sid>hi("Function",     s:cyan, "", s:cterm0D, "", "", "")
call <sid>hi("Identifier",   s:orange, "", s:cterm08, "", "none", "")
call <sid>hi("Include",      s:blue, "", s:cterm0D, "", "", "")
call <sid>hi("Keyword",      s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("Label",        s:base6, "", s:cterm0A, "", "", "")
call <sid>hi("Number",       s:magenta, "", s:cterm09, "", "", "")
call <sid>hi("Operator",     s:base6, "", s:cterm05, "", "none", "")
call <sid>hi("PreProc",      s:yellow, "", s:cterm0A, "", "", "")
call <sid>hi("Repeat",       s:violet, "", s:cterm0A, "", "", "")
call <sid>hi("Special",      s:base6, "", s:cterm0C, "", "", "")
call <sid>hi("SpecialChar",  s:magenta, "", s:cterm0F, "", "", "")
call <sid>hi("Statement",    s:yellow, "", s:cterm08, "", "", "")
call <sid>hi("StorageClass", s:yellow, "", s:cterm0A, "", "", "")
call <sid>hi("String",       s:green, "", s:cterm0B, "", "", "")
call <sid>hi("Structure",    s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("Tag",          s:yellow, "", s:cterm0A, "", "", "")
call <sid>hi("Todo",         s:red, s:base, s:cterm0A, s:cterm01, "", "")
call <sid>hi("Type",         s:base6, "", s:cterm0A, "", "none", "")
call <sid>hi("Typedef",      s:yellow, "", s:cterm0A, "", "", "")
call <sid>hi("Note",      s:yellow, "", s:cterm0A, "", "", "")

" C highlighting
call <sid>hi("cOperator",   s:cyan, "", s:cterm0C, "", "", "")
call <sid>hi("cPreCondit",  s:violet, "", s:cterm0E, "", "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:base6, "", s:cterm05, "", "", "")
call <sid>hi("cssClassName",   s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("cssColor",       s:cyan, "", s:cterm0C, "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:green, s:base2,  s:cterm0B, s:cterm01, "", "")
call <sid>hi("DiffChange",   s:base4, s:base2,  s:cterm03, s:cterm01, "", "")
call <sid>hi("DiffDelete",   s:red, s:base2,  s:cterm08, s:cterm01, "", "")
call <sid>hi("DiffText",     s:blue, s:base2,  s:cterm0D, s:cterm01, "", "")
call <sid>hi("DiffAdded",    s:green, s:base,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffFile",     s:red, s:base,  s:cterm08, s:cterm00, "", "")
call <sid>hi("DiffNewFile",  s:green, s:base,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffLine",     s:blue, s:base,  s:cterm0D, s:cterm00, "", "")
call <sid>hi("DiffRemoved",  s:red, s:base,  s:cterm08, s:cterm00, "", "")

" Git highlighting
call <sid>hi("gitcommitOverflow",       s:red, "", s:cterm08, "", "", "")
call <sid>hi("gitcommitSummary",        s:green, "", s:cterm0B, "", "", "")
call <sid>hi("gitcommitComment",        s:base4, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitUntracked",      s:base4, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitDiscarded",      s:base4, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitSelected",       s:base4, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitHeader",         s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("gitcommitSelectedType",   s:blue, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitUnmergedType",   s:blue, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitDiscardedType",  s:blue, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitBranch",         s:orange, "", s:cterm09, "", "bold", "")
call <sid>hi("gitcommitUntrackedFile",  s:yellow, "", s:cterm0A, "", "", "")
call <sid>hi("gitcommitUnmergedFile",   s:red, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitDiscardedFile",  s:red, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitSelectedFile",   s:green, "", s:cterm0B, "", "bold", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:green, s:base1, s:cterm0B, s:cterm01, "", "")
call <sid>hi("GitGutterChange",  s:violet, s:base1, s:cterm0D, s:cterm01, "", "")
call <sid>hi("GitGutterDelete",  s:red, s:base1, s:cterm08, s:cterm01, "", "")
call <sid>hi("GitGutterChangeDelete",  s:orange, s:base1, s:cterm0E, s:cterm01, "", "")

" HTML highlighting
call <sid>hi("htmlBold",    s:yellow, "", s:cterm0A, "", "", "")
call <sid>hi("htmlItalic",  s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("htmlTagName", s:base6, "", s:cterm0E, "", "", "")
call <sid>hi("htmlArg",     s:yellow, "", s:cterm0E, "", "", "")
call <sid>hi("htmlEndTag",  s:magenta, "", s:cterm05, "", "", "")
call <sid>hi("htmlTag",     s:magenta, "", s:cterm05, "", "", "")

" pangloss/vim-javascript highlighting
call <sid>hi("jsOperator",           s:base6, "", s:cterm0D, "", "", "")
call <sid>hi("jsStatement",          s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("jsReturn",             s:violet, "", s:cterm0E, "", "bold", "")
call <sid>hi("jsThis",               s:orange, "", s:cterm08, "", "", "")
call <sid>hi("jsClassDefinition",    s:orange, "", s:cterm0A, "", "", "")
call <sid>hi("jsFunction",           s:yellow, "", s:cterm0E, "", "", "")
call <sid>hi("jsFuncName",           s:cyan, "", s:cterm0D, "", "", "")
call <sid>hi("jsFuncCall",           s:cyan, "", s:cterm0D, "", "", "")
call <sid>hi("jsClassFuncName",      s:cyan, "", s:cterm0D, "", "", "")
call <sid>hi("jsClassMethodType",    s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("jsRegexpString",       s:cyan, "", s:cterm0C, "", "", "")
call <sid>hi("jsGlobalObjects",      s:blue, "", s:cterm0A, "", "", "")
call <sid>hi("jsGlobalNodeObjects",  s:blue, "", s:cterm0A, "", "", "")
call <sid>hi("jsBuiltins",           s:violet, "", s:cterm0A, "", "", "")
call <sid>hi("jsImport",             s:orange, "", s:cterm0A, "", "", "")
call <sid>hi("jsExport",             s:orange, "", s:cterm0A, "", "", "")
call <sid>hi("jsRegexpString",       s:base6, "", s:cterm0C, "", "", "")
call <sid>hi("jsClassKeyword",       s:yellow, "", s:cterm0C, "", "bold", "")
call <sid>hi("jsExtendsKeyword",     s:yellow, "", s:cterm0C, "", "bold", "")
call <sid>hi("jsFrom",               s:orange, "", s:cterm0C, "", "", "")
call <sid>hi("jsObjectKey",          s:base7, "", s:cterm0C, "", "", "")
call <sid>hi("jsNoise",              s:base4, "", s:cterm0C, "", "", "")
call <sid>hi("jsTemplateExpression", s:base6, "", s:cterm0C, "", "", "")

" Handlebars highlighting
call <sid>hi("hbsHandles",        s:magenta, "", s:cterm0A, "", "", "")
call <sid>hi("hbsIdentifier",     s:base7, "", s:cterm0A, "", "", "")
call <sid>hi("hbsString",         s:green, "", s:cterm0A, "", "", "")
call <sid>hi("hbsMustacheName",   s:cyan, "", s:cterm0A, "", "", "")
call <sid>hi("hbsPencilName",     s:cyan, "", s:cterm0A, "", "", "")
call <sid>hi("hbsBuiltInHelper",  s:cyan, "", s:cterm0A, "", "", "")
call <sid>hi("hbsKeyword",        s:violet, "", s:cterm0A, "", "", "")
call <sid>hi("hbsArg",            s:yellow, "", s:cterm0A, "", "", "")

" Mail highlighting
call <sid>hi("mailQuoted1",  s:yellow, "", s:cterm0A, "", "", "")
call <sid>hi("mailQuoted2",  s:green, "", s:cterm0B, "", "", "")
call <sid>hi("mailQuoted3",  s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("mailQuoted4",  s:cyan, "", s:cterm0C, "", "", "")
call <sid>hi("mailQuoted5",  s:blue, "", s:cterm0D, "", "", "")
call <sid>hi("mailQuoted6",  s:yellow, "", s:cterm0A, "", "", "")
call <sid>hi("mailURL",      s:blue, "", s:cterm0D, "", "", "")
call <sid>hi("mailEmail",    s:blue, "", s:cterm0D, "", "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:green, "", s:cterm0B, "", "", "")
call <sid>hi("markdownError",             s:base6, s:base, s:cterm05, s:cterm00, "", "")
call <sid>hi("markdownCodeBlock",         s:green, "", s:cterm0B, "", "", "")
call <sid>hi("markdownHeadingDelimiter",  s:blue, "", s:cterm0D, "", "", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:magenta, "", s:cterm0D, "", "", "")
call <sid>hi("NERDTreeExecFile",  s:base6, "", s:cterm05, "", "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:base6, "", s:cterm05, "", "", "")
call <sid>hi("phpComparison",      s:base6, "", s:cterm05, "", "", "")
call <sid>hi("phpParent",          s:base6, "", s:cterm05, "", "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("pythonRepeat",    s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("pythonInclude",   s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("pythonStatement", s:violet, "", s:cterm0E, "", "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:blue, "", s:cterm0D, "", "", "")
call <sid>hi("rubyConstant",                s:yellow, "", s:cterm0A, "", "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:magenta, "", s:cterm0F, "", "", "")
call <sid>hi("rubyRegexp",                  s:cyan, "", s:cterm0C, "", "", "")
call <sid>hi("rubySymbol",                  s:green, "", s:cterm0B, "", "", "")
call <sid>hi("rubyStringDelimiter",         s:green, "", s:cterm0B, "", "", "")

" SASS highlighting
call <sid>hi("sassidChar",     s:red, "", s:cterm08, "", "", "")
call <sid>hi("sassClassChar",  s:orange, "", s:cterm09, "", "", "")
call <sid>hi("sassInclude",    s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("sassMixing",     s:violet, "", s:cterm0E, "", "", "")
call <sid>hi("sassMixinName",  s:blue, "", s:cterm0D, "", "", "")

" CtrlP highlighting
call <sid>hi("CtrlPNoEntries",  s:blue, "", s:cterm0D, "", "", "")

" Startify highlighting
call <sid>hi("startifyBracket", s:blue, "", s:cterm0D, "", "", "")
call <sid>hi("startifySlash",   s:cyan, "", s:cterm0D, "", "", "")
call <sid>hi("startifyFile",    s:base6, "", s:cterm0D, "", "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:green, s:base2, s:cterm0B, s:cterm01, "", "")
call <sid>hi("SignifySignChange",  s:blue, s:base2, s:cterm0D, s:cterm01, "", "")
call <sid>hi("SignifySignDelete",  s:red, s:base2, s:cterm08, s:cterm01, "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", s:base, "", s:cterm00, "undercurl", s:red)
call <sid>hi("SpellLocal",   "", s:base, "", s:cterm00, "undercurl", s:cyan)
call <sid>hi("SpellCap",     "", s:base, "", s:cterm00, "undercurl", s:blue)
call <sid>hi("SpellRare",    "", s:base, "", s:cterm00, "undercurl", s:violet)

" Syntastic warning
call <sid>hi("SyntasticWarningSign",    s:yellow, "", s:cterm00, "", "", "")

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:base s:base1 s:base2 s:base3 s:base4  s:base5  s:base6  s:base7  s:base8  s:red  s:orange s:yellow  s:green  s:cyan  s:blue  s:violet  s:magenta
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
