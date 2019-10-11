hi clear
syntax reset
let g:colors_name = "my"

let s:dark_palette = {
            \'background': 'Black',
            \'normal': 'GhostWhite',
            \'keyword': '#f8cc54',
            \'string': '#84c059',
            \'warning': '#C67C48',
            \'error': '#C64848',
            \}

let s:light_palette = {
            \'background': 'GhostWhite',
            \'normal': 'DarkSlateGray',
            \'keyword': 'peru',
            \'string': '#84c059',
            \'warning': '#C67C48',
            \'error': '#C64848',
            \}

function! SetColor(group,fg,bg,flags)
    let style = a:group

    if &background == "light"
        let fg = get(s:light_palette, a:fg, a:fg)
        let bg = get(s:light_palette, a:bg, a:bg)
    elseif &background == "dark"
        let fg = get(s:dark_palette, a:fg, a:fg)
        let bg = get(s:dark_palette, a:bg, a:bg)
    endif
    

    let flags = a:flags

    let style = 'hi '.a:group.' guifg='.fg.' guibg='.bg.' gui='.flags.' cterm='.flags
    exe style
endfunction

if &background == "light"
    hi Normal gui=NONE guifg=DarkSlateGray guibg=Ivory1

    hi Cursor gui=reverse guifg=NONE guibg=NONE
    hi CursorColumn gui=NONE guifg=NONE guibg=NONE
    hi CursorLine gui=NONE guifg=NONE guibg=Snow2 cterm=NONE

    hi LineNr gui=NONE guifg=LightGray guibg=NONE
    hi CursorLineNr gui=NONE guifg=DarkSlateGray guibg=NONE

    hi ColorColumn gui=NONE guifg=NONE guibg=snow2


    "" Syntax
    hi Comment gui=italic guifg=ivory4 guibg=NONE cterm=italic
    hi Include gui=bold guifg=goldenrod guibg=NONE cterm=bold

    hi Statement gui=bold guifg=Peru guibg=NONE cterm=bold
    hi Boolean gui=NONE guifg=#707070 guibg=NONE
    hi Type gui=NONE guifg=#4a4a4a guibg=NONE
    hi PreProc gui=NONE guifg=Peru guibg=NONE

    hi Constant gui=NONE guifg=#707070 guibg=NONE
    hi Number gui=NONE guifg=SteelBlue guibg=NONE
    hi String gui=NONE guifg=ForestGreen guibg=NONE
    hi Identifier gui=NONE guifg=DeepSkyBlue4 guibg=NONE
    "" hi StorageClass gui=NONE guifg=#4a4a4a guibg=NONE
    "" hi Conditional
    
    "" Errors
    hi Error gui=NONE guifg=NONE guibg=coral
    hi ErrorMsg gui=NONE guifg=NONE guibg=#fff0f0


    hi Conceal gui=NONE guifg=#707070 guibg=NONE

    hi DiffAdd gui=NONE guifg=NONE guibg=#f0fff0
    hi DiffChange gui=NONE guifg=NONE guibg=#f5f5f5
    hi DiffDelete gui=NONE guifg=NONE guibg=#fff0f0
    hi DiffText gui=NONE guifg=NONE guibg=#e3e3e3

    hi Directory gui=NONE guifg=#4a4a4a guibg=NONE
    hi FoldColumn gui=NONE guifg=#c2c2c2 guibg=NONE
    hi Folded gui=NONE guifg=#969696 guibg=NONE
    hi Ignore gui=NONE guifg=NONE guibg=NONE
    hi IncSearch gui=NONE guifg=NONE guibg=#e3e3e3
    hi MatchParen gui=NONE guifg=NONE guibg=#e3e3e3
    hi ModeMsg gui=NONE guifg=NONE guibg=NONE
    hi MoreMsg gui=NONE guifg=NONE guibg=NONE
    hi NonText gui=NONE guifg=#c2c2c2 guibg=NONE
    hi Pmenu gui=NONE guifg=NONE guibg=#f5f5f5
    hi PmenuSbar gui=NONE guifg=NONE guibg=#ededed
    hi PmenuSel gui=NONE guifg=NONE guibg=#e3e3e3
    hi PmenuThumb gui=NONE guifg=NONE guibg=#dbdbdb
    hi Question gui=NONE guifg=NONE guibg=NONE
    hi Search gui=NONE guifg=NONE guibg=#ededed
    hi SignColumn gui=NONE guifg=#c2c2c2 guibg=NONE
    hi Special gui=NONE guifg=#707070 guibg=NONE
    hi SpecialKey gui=NONE guifg=#c2c2c2 guibg=NONE

    "" Spell
    hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=Coral
    hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=Coral
    hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=#f0fff0
    hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=#ededed

    "" User Interface
    hi StatusLine gui=NONE guifg=Black guibg=ivory3 cterm=NONE
    hi StatusLineNC gui=NONE guifg=Black guibg=ivory4 cterm=NONE

    hi TabLine gui=NONE guifg=black guibg=ivory4 cterm=NONE
    hi TabLineFill gui=NONE guifg=NONE guibg=gray
    hi TabLineSel gui=NONE guifg=#262626 guibg=ivory2 cterm=NONE
    hi VertSplit gui=NONE guifg=black guibg=NONE cterm=NONE

    hi Title gui=NONE guifg=#707070 guibg=NONE
    hi Todo gui=standout guifg=Coral guibg=Black cterm=standout
    hi Underlined gui=NONE guifg=NONE guibg=NONE
    hi Visual gui=NONE guifg=NONE guibg=#e3e3e3
    hi VisualNOS gui=NONE guifg=NONE guibg=NONE
    hi WarningMsg gui=NONE guifg=NONE guibg=#fff0f0
    hi WildMenu gui=NONE guifg=NONE guibg=#d1d1d1
    hi lCursor gui=NONE guifg=NONE guibg=NONE
elseif &background == "dark"
    hi Normal gui=NONE guifg=Ivory1 guibg=Gray16

    hi Cursor gui=reverse guifg=NONE guibg=NONE
    hi CursorColumn cterm=NONE gui=NONE guifg=NONE guibg=#333333
    hi CursorLine cterm=NONE gui=NONE guifg=NONE guibg=#333333

    hi LineNr gui=NONE guifg=#616161 guibg=NONE
    hi CursorLineNr gui=NONE guifg=#707070 guibg=NONE
    
    hi ColorColumn gui=NONE guifg=NONE guibg=#2a2a2a

    "" Syntax
    hi Comment gui=italic guifg=ivory3 guibg=NONE cterm=italic
    hi Include gui=bold guifg=goldenrod1 guibg=NONE cterm=bold

    "" hi Statement gui=NONE guifg=#f8cc54 guibg=NONE
    hi Statement gui=NONE guifg=gold guibg=NONE
    hi Boolean gui=NONE guifg=plum guibg=NONE
    hi Type gui=NONE guifg=steelblue1 guibg=NONE
    "" call SetColor("Function", "#66CCFF", "NONE", "bold")
    """ hi Function gui=NONE guifg=white guibg=NONE
    "" hi StorageClass gui=NONE guifg=#66ccff guibg=NONE

    hi Constant gui=NONE guifg=#808080 guibg=NONE
    hi Number gui=NONE guifg=plum guibg=NONE
    call SetColor("String", "string", "NONE", "NONE")
    "" hi Identifier gui=NONE guifg=NONE guibg=NONE
    hi Identifier gui=NONE guifg=white guibg=NONE

    "" Errors
    call SetColor("Error", "error", "NONE", "standout")
    "" hi Error gui=NONE guifg=NONE guibg=#260808

    hi ErrorMsg gui=NONE guifg=NONE guibg=#330a0b
    hi Conceal gui=NONE guifg=#808080 guibg=NONE
    hi DiffAdd gui=NONE guifg=NONE guibg=#0a330a
    hi DiffChange gui=NONE guifg=NONE guibg=#1a1a1a
    hi DiffDelete gui=NONE guifg=NONE guibg=#330a0b
    hi DiffText gui=NONE guifg=NONE guibg=#4d4d4d
    hi Directory gui=NONE guifg=#66ccff guibg=#1a1a1a
    hi FoldColumn gui=NONE guifg=#616161 guibg=NONE
    hi Folded gui=NONE guifg=#707070 guibg=NONE
    hi Ignore gui=NONE guifg=NONE guibg=NONE
    hi IncSearch gui=NONE guifg=NONE guibg=#333333
    hi MatchParen gui=NONE guifg=NONE guibg=#333333
    hi ModeMsg gui=NONE guifg=NONE guibg=NONE
    hi MoreMsg gui=NONE guifg=NONE guibg=NONE
    hi NonText gui=NONE guifg=#cce1b7 guibg=NONE
    hi Operator gui=None guifg=#FF9300 guibg=NONE
    hi Pmenu gui=NONE guifg=NONE guibg=#1a1a1a
    hi PmenuSbar gui=NONE guifg=NONE guibg=#262626
    hi PmenuSel gui=NONE guifg=NONE guibg=#333333
    hi PmenuThumb gui=NONE guifg=NONE guibg=#424242
    hi Question gui=NONE guifg=NONE guibg=NONE
    hi Search gui=NONE guifg=NONE guibg=#262626
    hi SignColumn gui=NONE guifg=#616161 guibg=NONE
    hi Special gui=NONE guifg=#808080 guibg=NONE
    hi SpecialKey gui=NONE guifg=#616161 guibg=NONE

    "" Spell
    hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=#5e1214
    hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=NONE
    hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=#0a330a
    hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=#262626

    "" User Interface
    hi StatusLine gui=NONE guifg=#9e9e9e guibg=#262626
    hi StatusLineNC gui=NONE guifg=#707070 guibg=#262626
    hi TabLine gui=NONE guifg=#707070 guibg=#262626 term=NONE cterm=NONE
    hi TabLineFill gui=NONE guifg=NONE guibg=#262626 term=NONE cterm=NONE
    hi TabLineSel gui=NONE guifg=#cccccc guibg=#262626
    hi Title gui=bold guifg=#f8cc54 guibg=#1a1a1a
    call SetColor("Todo", "warning", "NONE", "standout")
    ""    hi Todo gui=standout guifg=#f8cc54 guibg=NONE
    hi Underlined gui=NONE guifg=NONE guibg=NONE
    hi VertSplit gui=NONE guifg=#333333 guibg=NONE
    hi Visual gui=NONE guifg=NONE guibg=#4d4d4d
    hi VisualNOS gui=NONE guifg=NONE guibg=NONE
    hi WarningMsg gui=NONE guifg=NONE guibg=#330a0b
    hi WildMenu gui=NONE guifg=NONE guibg=#525252
    hi lCursor gui=NONE guifg=NONE guibg=NONE
    hi PreProc gui=NONE guifg=NONE guibg=NONE
endif
