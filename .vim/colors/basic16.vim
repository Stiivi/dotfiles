hi clear
"" syntax reset
let g:colors_name = "basic16"

if &background == "light"
    hi Normal gui=NONE cterm=NONE ctermbg=15
    hi Ignore gui=NONE cterm=NONE ctermfg=DarkGray

    "" Cursor and Line
    hi Cursor gui=reverse
    hi CursorColumn gui=NONE  
    hi CursorLine gui=NONE cterm=NONE ctermbg=7

    hi LineNr gui=NONE cterm=NONE ctermfg=8
    hi CursorLineNr gui=NONE cterm=NONE ctermfg=0 ctermbg=7
    hi ColorColumn gui=NONE cterm=NONE ctermbg=7
    hi Visual gui=NONE cterm=NONE ctermbg=12

    "" User Interface
    hi StatusLine gui=bold cterm=bold ctermfg=7 ctermbg=0
    hi StatusLineNC gui=none cterm=none ctermfg=7 ctermbg=8

    hi TabLine gui=NONE cterm=NONE ctermfg=7 ctermbg=8
    hi TabLineSel gui=NONE cterm=NONE ctermfg=7 ctermbg=0
    hi TabLineFill gui=NONE cterm=NONE ctermbg=8
    hi VertSplit gui=NONE cterm=NONE ctermfg=Black

    hi Title gui=bold cterm=bold ctermfg=4

    hi Pmenu gui=NONE cterm=NONE ctermbg=LightGray
    hi PmenuSel gui=NONE cterm=NONE ctermbg=DarkGray

    hi Conceal gui=NONE cterm=NONE ctermbg=7

    hi Folded gui=NONE cterm=NONE ctermbg=11 ctermfg=NONE

    "" Search
    hi Search gui=NONE cterm=NONE ctermbg=LightGray
    hi MatchParen gui=NONE cterm=underline 
    ""ctermbg=7

    "" Syntax
    hi Comment gui=italic cterm=italic ctermfg=8
    hi Include gui=bold cterm=bold ctermfg=3

    hi PreProc gui=NONE cterm=NONE ctermfg=8

    hi Statement gui=bold cterm=bold ctermfg=3
    hi! link Special Statement
    hi! link Boolean Number
    hi Number gui=NONE cterm=NONE ctermfg=4 
    hi String gui=NONE cterm=NONE ctermfg=2 
    hi Type gui=NONE cterm=NONE ctermfg=4 
    hi Identifier gui=NONE cterm=NONE ctermfg=4 
    hi Function gui=NONE cterm=NONE ctermfg=3 

    hi Todo gui=bold,standout cterm=bold,standout ctermfg=11 ctermbg=0
    "" Errors 
    hi Error gui=NONE ctermbg=1
    hi ErrorMsg gui=NONE ctermbg=1
    "
    "" Spell
    hi SpellBad gui=undercurl  ctermbg=9
    hi SpellCap gui=undercurl  ctermbg=9
    hi SpellLocal gui=undercurl  ctermbg=10
    hi SpellRare gui=undercurl cterm=italic,underline ctermbg=DarkYellow
elseif &background == "dark"
    hi Normal gui=NONE cterm=NONE ctermbg=0
    "
    "" Cursor and Line
    hi Cursor gui=reverse
    hi CursorColumn gui=NONE  
    hi CursorLine gui=NONE cterm=NONE ctermbg=8

    hi LineNr gui=NONE cterm=NONE ctermfg=8
    hi CursorLineNr gui=NONE cterm=NONE ctermfg=7 ctermbg=8
    hi ColorColumn gui=NONE cterm=NONE ctermfg=0 ctermbg=8
    hi Visual gui=NONE cterm=NONE ctermbg=8

    "" User Interface
    hi StatusLine gui=bold cterm=bold ctermfg=15 ctermbg=7
    hi StatusLineNC gui=none cterm=none ctermfg=0 ctermbg=8

    hi TabLine gui=NONE cterm=NONE ctermfg=7 ctermbg=8
    hi TabLineSel gui=NONE cterm=NONE ctermfg=0 ctermbg=7
    hi TabLineFill gui=NONE cterm=NONE ctermbg=8
    hi VertSplit gui=NONE cterm=NONE ctermfg=7

    hi Title gui=bold cterm=bold ctermfg=4
    hi Pmenu gui=NONE cterm=NONE ctermfg=7 ctermbg=8
    hi PmenuSel gui=NONE cterm=NONE ctermfg=0 ctermbg=7

    "" Search
    hi Search gui=NONE cterm=NONE ctermfg=7 ctermbg=8
    hi MatchParen gui=NONE cterm=underline
    "" ctermbg=12

    "" Syntax
    hi Comment gui=italic cterm=italic ctermfg=7
    hi Include gui=bold cterm=bold ctermfg=11

    hi PreProc gui=NONE cterm=NONE ctermfg=7

    hi Statement gui=bold cterm=bold ctermfg=3
    hi! link Special Statement
    hi! link Boolean Number
    hi Number gui=NONE cterm=NONE ctermfg=4 
    hi String gui=NONE cterm=NONE ctermfg=2 
    hi Type gui=NONE cterm=NONE ctermfg=4 
    hi Identifier gui=NONE cterm=NONE ctermfg=12

    hi Todo gui=bold,standout cterm=bold,standout ctermfg=11 ctermbg=0
    "
    "" Errors 
    hi Error gui=NONE ctermbg=1
    hi ErrorMsg gui=NONE ctermbg=1
    "
    "" Spell
    hi SpellBad gui=undercurl  ctermbg=9
    hi SpellCap gui=undercurl  ctermbg=9
    hi SpellLocal gui=undercurl  ctermbg=10
    hi SpellRare gui=undercurl cterm=italic,underline ctermbg=DarkYellow
endif
