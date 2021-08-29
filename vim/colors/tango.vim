"-----------------------------------------------------------------
"   _____
"  |_   _|_ _ _ __   __ _  ___
"    | |/ _` | '_ \ / _` |/ _ \
"    | | (_| | | | | (_| | (_) |
"    |_|\__,_|_| |_|\__, |\___/
"                   |___/
"-----------------------------------------------------------------
" Name:    Tango
" Version: 1.0.2
" License: MIT
" Author:  Michele Campeotto <micampe@micampe.it>
" Author:  Jansen Price
"-----------------------------------------------------------------
" Uses the Tango color palette.
" For best results, set up your terminal with a Tango palette.
" Instructions for GNOME Terminal:
" http://uwstopia.nl/blog/2006/07/tango-terminal
"-----------------------------------------------------------------
" Useful commands for testing colorschemes:
" :source $VIMRUNTIME/syntax/hitest.vim
" :help highlight-groups
" :help cterm-colors
" :help group-name
"-----------------------------------------------------------------

set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "tango"

"-----------------------------------------------------------------
" Color Palette {{{
"-----------------------------------------------------------------

" Define the Tango Color Palette
let s:aluminium_highlight  = "#eeeeec"
let s:aluminium            = "#d3d7cf"
let s:aluminium_shadow     = "#babdb6"
let s:butter_highlight     = "#fce94f"
let s:butter               = "#edd400"
let s:butter_shadow        = "#c4a000"
let s:orange_highlight     = "#fcaf3e"
let s:orange               = "#f57900"
let s:orange_shadow        = "#ce5c00"
let s:chocolate_highlight  = "#e9b96e"
let s:chocolate            = "#c17d11"
let s:chocolate_shadow     = "#8f5902"
let s:chameleon_highlight  = "#8ae234"
let s:chameleon            = "#73d216"
let s:chameleon_shadow     = "#4e9a06"
let s:skyblue_highlight    = "#729fcf"
let s:skyblue              = "#3465a4"
let s:skyblue_shadow       = "#204a87"
let s:plum_highlight       = "#ad7fa8"
let s:plum                 = "#75507b"
let s:plum_shadow          = "#5c3566"
let s:slate_highlight      = "#888a85"
let s:slate                = "#555753"
let s:slate_shadow         = "#2e3436"
let s:scarletred_highlight = "#ef2929"
let s:scarletred           = "#cc0000"
let s:scarletred_shadow    = "#a40000"
let s:white                = "#ffffff"

" These are non-standard but look good with tango
let s:skyblue_dark         = "#11284a"
let s:skyblue_dusk         = "#21385a"
let s:night                = "#1e1e1e"
let s:cyan                 = "#06989a"

" }}}

"-----------------------------------------------------------------
" Definitions {{{
"-----------------------------------------------------------------

" Define some default states
let s:none    = ' gui=NONE'
let s:bold    = ' gui=bold'
let s:ital    = ' gui=italic'
let s:line    = ' gui=underline'
let s:curl    = ' gui=undercurl'
let s:fg_none = ' guifg=NONE'
let s:bg_none = ' guibg=NONE'

" Define the fg setters
exe "let s:fg_alum_h = ' guifg=" . s:aluminium_highlight . "'"
exe "let s:fg_alum   = ' guifg=" . s:aluminium . "'"
exe "let s:fg_alum_s = ' guifg=" . s:aluminium_shadow . "'"
exe "let s:fg_bttr_h = ' guifg=" . s:butter_highlight . "'"
exe "let s:fg_bttr   = ' guifg=" . s:butter . "'"
exe "let s:fg_bttr_s = ' guifg=" . s:butter_shadow . "'"
exe "let s:fg_orng_h = ' guifg=" . s:orange_highlight . "'"
exe "let s:fg_orng   = ' guifg=" . s:orange . "'"
exe "let s:fg_orng_s = ' guifg=" . s:orange_shadow . "'"
exe "let s:fg_choc_h = ' guifg=" . s:chocolate_highlight . "'"
exe "let s:fg_choc   = ' guifg=" . s:chocolate . "'"
exe "let s:fg_choc_s = ' guifg=" . s:chocolate_shadow . "'"
exe "let s:fg_cham_h = ' guifg=" . s:chameleon_highlight . "'"
exe "let s:fg_cham   = ' guifg=" . s:chameleon . "'"
exe "let s:fg_cham_s = ' guifg=" . s:chameleon_shadow . "'"
exe "let s:fg_skyb_h = ' guifg=" . s:skyblue_highlight . "'"
exe "let s:fg_skyb   = ' guifg=" . s:skyblue . "'"
exe "let s:fg_skyb_s = ' guifg=" . s:skyblue_shadow . "'"
exe "let s:fg_plum_h = ' guifg=" . s:plum_highlight . "'"
exe "let s:fg_plum   = ' guifg=" . s:plum . "'"
exe "let s:fg_plum_s = ' guifg=" . s:plum_shadow . "'"
exe "let s:fg_slat_h = ' guifg=" . s:slate_highlight . "'"
exe "let s:fg_slat   = ' guifg=" . s:slate . "'"
exe "let s:fg_slat_s = ' guifg=" . s:slate_shadow . "'"
exe "let s:fg_scar_h = ' guifg=" . s:scarletred_highlight . "'"
exe "let s:fg_scar   = ' guifg=" . s:scarletred . "'"
exe "let s:fg_scar_s = ' guifg=" . s:scarletred_shadow . "'"
exe "let s:fg_dark   = ' guifg=" . s:skyblue_dark . "'"
exe "let s:fg_dusk   = ' guifg=" . s:skyblue_dusk . "'"
exe "let s:fg_cyan   = ' guifg=" . s:cyan . "'"
exe "let s:fg_night  = ' guifg=" . s:night . "'"

" Define the bg setters
exe "let s:bg_alum_h = ' guibg=" . s:aluminium_highlight . "'"
exe "let s:bg_alum   = ' guibg=" . s:aluminium . "'"
exe "let s:bg_alum_s = ' guibg=" . s:aluminium_shadow . "'"
exe "let s:bg_bttr_h = ' guibg=" . s:butter_highlight . "'"
exe "let s:bg_bttr   = ' guibg=" . s:butter . "'"
exe "let s:bg_bttr_s = ' guibg=" . s:butter_shadow . "'"
exe "let s:bg_orng_h = ' guibg=" . s:orange_highlight . "'"
exe "let s:bg_orng   = ' guibg=" . s:orange . "'"
exe "let s:bg_orng_s = ' guibg=" . s:orange_shadow . "'"
exe "let s:bg_choc_h = ' guibg=" . s:chocolate_highlight . "'"
exe "let s:bg_choc   = ' guibg=" . s:chocolate . "'"
exe "let s:bg_choc_s = ' guibg=" . s:chocolate_shadow . "'"
exe "let s:bg_cham_h = ' guibg=" . s:chameleon_highlight . "'"
exe "let s:bg_cham   = ' guibg=" . s:chameleon . "'"
exe "let s:bg_cham_s = ' guibg=" . s:chameleon_shadow . "'"
exe "let s:bg_skyb_h = ' guibg=" . s:skyblue_highlight . "'"
exe "let s:bg_skyb   = ' guibg=" . s:skyblue . "'"
exe "let s:bg_skyb_s = ' guibg=" . s:skyblue_shadow . "'"
exe "let s:bg_plum_h = ' guibg=" . s:plum_highlight . "'"
exe "let s:bg_plum   = ' guibg=" . s:plum . "'"
exe "let s:bg_plum_s = ' guibg=" . s:plum_shadow . "'"
exe "let s:bg_slat_h = ' guibg=" . s:slate_highlight . "'"
exe "let s:bg_slat   = ' guibg=" . s:slate . "'"
exe "let s:bg_slat_s = ' guibg=" . s:slate_shadow . "'"
exe "let s:bg_scar_h = ' guibg=" . s:scarletred_highlight . "'"
exe "let s:bg_scar   = ' guibg=" . s:scarletred . "'"
exe "let s:bg_scar_s = ' guibg=" . s:scarletred_shadow . "'"
exe "let s:bg_whit   = ' guibg=" . s:white . "'"
exe "let s:bg_dark   = ' guibg=" . s:skyblue_dark . "'"
exe "let s:bg_dusk   = ' guibg=" . s:skyblue_dusk . "'"
exe "let s:bg_cyan   = ' guibg=" . s:cyan . "'"
exe "let s:bg_night  = ' guibg=" . s:night . "'"

exe "let s:sp_scar   = ' guisp=" . s:scarletred_highlight . "'"
exe "let s:sp_skyb   = ' guisp=" . s:skyblue_highlight . "'"
exe "let s:sp_plum   = ' guisp=" . s:plum_highlight . "'"
exe "let s:sp_orng   = ' guisp=" . s:orange . "'"

" }}}

"-----------------------------------------------------------------
" GUI Color Highlight Settings {{{
"-----------------------------------------------------------------

" Settings for the canvas (backdrop)
if exists("g:tango_night") && g:tango_night == 1
    let s:canvas   = s:bg_night
    let s:canvas_l = s:bg_slat_s
else
    let s:canvas   = s:bg_dark
    let s:canvas_l = s:bg_dusk
endif

" Various occasions
exe "hi! SpecialKey"       . s:fg_skyb_h . s:bg_none   . s:none
exe "hi! NonText"          . s:fg_slat   . s:bg_none   . s:none
exe "hi! Directory"        . s:fg_skyb_h . s:bg_none   . s:none
exe "hi! ErrorMsg"         . s:fg_alum_h . s:bg_scar_h . s:none
exe "hi! IncSearch"        . s:fg_plum   . s:bg_alum_h . s:none
exe "hi! Search"           . s:fg_alum_h . s:bg_bttr_s . s:none
exe "hi! MoreMsg"          . s:fg_cham   . s:bg_none   . s:bold
exe "hi! ModeMsg"          . s:fg_alum_h . s:bg_none   . s:bold
exe "hi! LineNr"           . s:fg_bttr   . s:canvas_l  . s:none
exe "hi! CursorLineNr"     . s:fg_bttr_h . s:canvas_l  . s:bold
exe "hi! Question"         . s:fg_cham_h . s:bg_none   . s:bold
exe "hi! StatusLine"       . s:fg_alum_h . s:bg_cham_s . s:bold
exe "hi! StatusLineNC"     . s:fg_alum   . s:bg_cham_s . s:none
exe "hi! VertSplit"        . s:fg_alum_h . s:bg_alum_h . s:none
exe "hi! Title"            . s:fg_alum_h . s:bg_none   . s:bold
exe "hi! Visual"           . s:fg_alum   . s:bg_cham_s . s:none
exe "hi! WarningMsg"       . s:fg_scar_h . s:bg_none   . s:none
exe "hi! WildMenu"         . s:fg_slat_s . s:bg_bttr_h . s:none
exe "hi! Folded"           . s:fg_alum_h . s:bg_plum   . s:none
exe "hi! FoldColumn"       . s:fg_alum_h . s:bg_plum_h . s:none
exe "hi! DiffAdd"          . s:fg_alum_h . s:bg_skyb_h . s:none
exe "hi! DiffChange"       . s:fg_alum_h . s:bg_slat   . s:none
exe "hi! DiffDelete"       . s:fg_scar_s . s:bg_none   . s:none
exe "hi! DiffText"         . s:fg_alum_h . s:bg_bttr_s . s:none
exe "hi! SignColumn"       . s:fg_skyb_h . s:bg_alum_s . s:bold
exe "hi! Conceal"          . s:fg_slat   . s:bg_none   . s:none
exe "hi! SpellBad"         . s:fg_none   . s:bg_none   . s:curl . s:sp_scar
exe "hi! SpellCap"         . s:fg_none   . s:bg_none   . s:curl . s:sp_skyb
exe "hi! SpellRare"        . s:fg_none   . s:bg_none   . s:curl . s:sp_plum
exe "hi! SpellLocal"       . s:fg_none   . s:bg_none   . s:curl . s:sp_orng
exe "hi! Pmenu"            . s:fg_alum_h . s:bg_orng   . s:none
exe "hi! PmenuSel"         . s:fg_choc   . s:bg_alum_h . s:none
exe "hi! PmenuSbar"        . s:fg_choc   . s:bg_alum_s . s:none
exe "hi! PmenuThumb"       . s:fg_choc   . s:bg_alum_h . s:none
exe "hi! TabLine"          . s:fg_alum_h . s:bg_slat   . s:line
exe "hi! TabLineSel"       . s:fg_alum_h . s:bg_none   . s:bold
exe "hi! TabLineFill"      . s:fg_slat_s . s:bg_alum_h . s:none
exe "hi! CursorColumn"     . s:fg_alum_h . s:bg_slat_h . s:none
exe "hi! CursorLine"       . s:fg_alum_h . s:bg_slat_h . s:none
exe "hi! ColorColumn"      . s:fg_alum_h . s:canvas_l  . s:none
exe "hi! StatusLineTerm"   . s:fg_alum_h . s:bg_cham_s . s:bold
exe "hi! StatusLineTermNC" . s:fg_alum   . s:bg_cham_s . s:none
exe "hi! Cursor"           . s:fg_slat_s . s:bg_alum_h . s:none

" Syntax Common
if exists("g:tango_night") && g:tango_night == 1
    exe "hi! Normal"     . s:fg_alum_s . s:canvas  . s:none
    exe "hi! Type"       . s:fg_alum_s . s:bg_none . s:bold
    exe "hi! Comment"    . s:fg_skyb   . s:bg_none . s:none
    exe "hi! Constant"   . s:fg_bttr_s . s:bg_none . s:none
    exe "hi! Special"    . s:fg_plum_s . s:bg_none . s:none
    exe "hi! Identifier" . s:fg_cham_s . s:bg_none . s:none
    exe "hi! Statement"  . s:fg_cham   . s:bg_none . s:none
    exe "hi! PreProc"    . s:fg_plum_s . s:bg_none . s:none
    exe "hi! Number"     . s:fg_choc_s . s:bg_none . s:none

    exe "hi! Folded"     . s:fg_alum   . s:bg_plum_s . s:none
    exe "hi! FoldColumn" . s:fg_alum   . s:bg_plum . s:none
else
    exe "hi! Normal"     . s:fg_alum_h . s:canvas  . s:none
    exe "hi! Type"       . s:fg_alum   . s:bg_none . s:bold
    exe "hi! Comment"    . s:fg_cyan   . s:bg_none . s:none
    exe "hi! Constant"   . s:fg_bttr_s . s:bg_none . s:none
    exe "hi! Special"    . s:fg_plum   . s:bg_none . s:none
    exe "hi! Identifier" . s:fg_cham_h . s:bg_none . s:none
    exe "hi! Statement"  . s:fg_cham_s . s:bg_none . s:none
    exe "hi! PreProc"    . s:fg_scar   . s:bg_none . s:none
    exe "hi! Number"     . s:fg_skyb_h . s:bg_none . s:none
endif

" Syntax Special
exe "hi! lCursor"    . s:fg_slat   . s:bg_cham   . s:none
exe "hi! MatchParen" . s:fg_alum_h . s:bg_skyb_h . s:none
exe "hi! Underlined" . s:fg_skyb   . s:bg_none   . s:line
exe "hi! Error"      . s:fg_alum_h . s:bg_scar_h . s:none
exe "hi! Todo"       . s:fg_cham_h . s:bg_cham_s . s:bold

" }}}

"-----------------------------------------------------------------
" Terminal Color Highlight Settings {{{
"-----------------------------------------------------------------

" Default Colors
hi NonText      ctermfg=darkgray

" Search
hi Search       cterm=none ctermfg=grey ctermbg=blue
hi IncSearch    cterm=none ctermfg=yellow ctermbg=green

" Window Elements
hi StatusLine   ctermfg=white ctermbg=green cterm=bold
hi StatusLineNC ctermfg=lightgray ctermbg=darkgreen
hi Folded       ctermfg=white ctermbg=magenta
hi Visual       ctermbg=white ctermfg=lightgreen cterm=reverse

" Specials
hi Todo         ctermfg=white ctermbg=green
hi Title        ctermfg=white cterm=bold

" Syntax
hi Constant     ctermfg=darkyellow
hi Number       ctermfg=darkblue
hi Statement    ctermfg=green
hi Identifier   ctermfg=darkgreen
hi PreProc      ctermfg=darkred
hi Comment      ctermfg=cyan cterm=none
hi Type         ctermfg=gray cterm=bold
hi Special      ctermfg=magenta cterm=none
hi Error        ctermfg=white ctermbg=red

" Diff
hi DiffAdd      ctermfg=gray ctermbg=blue cterm=none
hi DiffChange   ctermfg=gray ctermbg=darkgray cterm=none
hi DiffDelete   ctermfg=gray ctermbg=none cterm=none
hi DiffText     ctermfg=gray ctermbg=yellow cterm=none

" }}}

" Make sure the airline redraws
if exists(':AirlineRefresh')
    AirlineRefresh
endif
