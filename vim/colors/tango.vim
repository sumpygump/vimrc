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
let s:aluminium_hl  = {"gui": "#eeeeec", "term": 7}
let s:aluminium     = {"gui": "#d3d7cf", "term": 252}
let s:aluminium_sd  = {"gui": "#babdb6", "term": 250}
let s:butter_hl     = {"gui": "#fce94f", "term": 221}
let s:butter        = {"gui": "#edd400", "term": 220}
let s:butter_sd     = {"gui": "#c4a000", "term": 178}
let s:orange_hl     = {"gui": "#fcaf3e", "term": 215}
let s:orange        = {"gui": "#f57900", "term": 208}
let s:orange_sd     = {"gui": "#ce5c00", "term": 166}
let s:chocolate_hl  = {"gui": "#e9b96e", "term": 179}
let s:chocolate     = {"gui": "#c17d11", "term": 136}
let s:chocolate_sd  = {"gui": "#8f5902", "term": 94}
let s:chameleon_hl  = {"gui": "#8ae234", "term": 113}
let s:chameleon     = {"gui": "#73d216", "term": 76}
let s:chameleon_sd  = {"gui": "#4e9a06", "term": 64}
let s:skyblue_hl    = {"gui": "#729fcf", "term": 74}
let s:skyblue       = {"gui": "#3465a4", "term": 61}
let s:skyblue_sd    = {"gui": "#204a87", "term": 24}
let s:plum_hl       = {"gui": "#ad7fa8", "term": 139}
let s:plum          = {"gui": "#75507b", "term": 96}
let s:plum_sd       = {"gui": "#5c3566", "term": 239}
let s:slate_hl      = {"gui": "#888a85", "term": 102}
let s:slate         = {"gui": "#555753", "term": 240}
let s:slate_sd      = {"gui": "#2e3436", "term": 236}
let s:scarletred_hl = {"gui": "#ef2929", "term": 9}
let s:scarletred    = {"gui": "#cc0000", "term": 1}
let s:scarletred_sd = {"gui": "#a40000", "term": 124}

" These are non-standard but look good with tango
let s:skyblue_dark = {"gui": "#11284a", "term": 236}
let s:skyblue_dusk = {"gui": "#21385a", "term": 237}
let s:night        = {"gui": "#1e1e1e", "term": 234}
let s:cyan         = {"gui": "#06989a", "term": 30}

" }}}

"-----------------------------------------------------------------
" Function gui_hi {{{
"-----------------------------------------------------------------
" Set the group and style
" @param `group`: group name
" @param `style`: dictionary with following possible keys
"                 - fg : set foreground color
"                 - bg : set background color
"                 - sp : set sp color (underline color)
"                 - fmt: set format options
" Possible format options are: bold, italic, underline, undercurl
"
" Example: call s:gui_hi("Normal", {"fg": "#343455", "fmt": "bold"})
function! s:gui_hi(group, style)
    if has("gui_running")
        execute "highlight!" a:group
            \ "guifg=" (has_key(a:style, "fg")  ? a:style.fg.gui : "NONE")
            \ "guibg=" (has_key(a:style, "bg")  ? a:style.bg.gui : "NONE")
            \ "guisp=" (has_key(a:style, "sp")  ? a:style.sp.gui : "NONE")
            \ "gui="   (has_key(a:style, "fmt") ? a:style.fmt    : "NONE")
    elseif &t_Co > 8
        execute "highlight!" a:group
            \ "ctermfg=" (has_key(a:style, "fg") ? a:style.fg.term : "NONE")
            \ "ctermbg=" (has_key(a:style, "bg") ? a:style.bg.term : "NONE")
            \ "cterm="   (has_key(a:style, "fmt") ? a:style.fmt    : "NONE")
    else
    endif
endfunction

function! s:t_hi(group, style)
    execute "highlight!" a:group
        \ "ctermfg=" (has_key(a:style, "fg") ? a:style.fg : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg") ? a:style.bg : "NONE")
        \ " " (has_key(a:style, "fmt") ? "cterm=". a:style.fmt : "")
        \ " " (has_key(a:style, "term") ? "term=". a:style.term : "")
endfunction

" }}}

"-----------------------------------------------------------------
" GUI Color Highlight Settings {{{
"-----------------------------------------------------------------

" Settings for the canvas (backdrop)
if exists("g:tango_night") && g:tango_night == 1
    let s:canvas   = s:night
    let s:canvas_l = s:slate_sd
else
    let s:canvas   = s:skyblue_dark
    let s:canvas_l = s:skyblue_dusk
endif

" Various occasions
call s:gui_hi("SpecialKey",   {"fg": s:skyblue_hl})
call s:gui_hi("NonText",      {"fg": s:slate})
call s:gui_hi("Directory",    {"fg": s:skyblue_hl})
call s:gui_hi("ErrorMsg",     {"fg": s:aluminium_hl, "bg": s:scarletred_hl})
call s:gui_hi("IncSearch",    {"fg": s:plum, "bg": s:aluminium_hl})
call s:gui_hi("Search",       {"fg": s:aluminium_hl, "bg": s:butter_sd})
call s:gui_hi("MoreMsg",      {"fg": s:chameleon})
call s:gui_hi("ModeMsg",      {"fg": s:aluminium_hl, "fmt": "bold"})
call s:gui_hi("LineNr",       {"fg": s:butter, "bg": s:canvas_l})
call s:gui_hi("CursorLineNr", {"fg": s:butter_hl, "bg": s:canvas_l, "fmt": "bold"})
call s:gui_hi("Question",     {"fg": s:chameleon_hl, "fmt": "bold"})
call s:gui_hi("StatusLine",   {"fg": s:aluminium_hl, "bg": s:chameleon_sd, "fmt": "bold"})
call s:gui_hi("StatusLineNC", {"fg": s:aluminium, "bg": s:chameleon_sd})
call s:gui_hi("VertSplit",    {"fg": s:aluminium_hl, "bg": s:aluminium_hl})
call s:gui_hi("Title",        {"fg": s:aluminium_hl, "fmt": "bold"})
call s:gui_hi("Visual",       {"fg": s:aluminium, "bg": s:chameleon_sd})
call s:gui_hi("WarningMsg",   {"fg": s:scarletred_hl})
call s:gui_hi("WildMenu",     {"fg": s:slate_sd, "bg": s:butter_hl})
call s:gui_hi("Folded",       {"fg": s:aluminium_hl, "bg": s:plum})
call s:gui_hi("FoldColumn",   {"fg": s:aluminium_hl, "bg": s:plum})
call s:gui_hi("DiffAdd",      {"fg": s:aluminium_hl, "bg": s:skyblue_hl})
call s:gui_hi("DiffChange",   {"fg": s:aluminium_hl, "bg": s:slate})
call s:gui_hi("DiffDelete",   {"fg": s:scarletred_sd})
call s:gui_hi("DiffText",     {"fg": s:aluminium_hl, "bg": s:butter_sd})
call s:gui_hi("SignColumn",   {"fg": s:skyblue_hl, "bg": s:aluminium_sd, "fmt": "bold"})
call s:gui_hi("Conceal",      {"fg": s:slate})
call s:gui_hi("SpellBad",     {"fmt": "undercurl", "sp": s:scarletred})
call s:gui_hi("SpellCap",     {"fmt": "undercurl", "sp": s:skyblue})
call s:gui_hi("SpellRare",    {"fmt": "undercurl", "sp": s:plum})
call s:gui_hi("SpellLocal",   {"fmt": "undercurl", "sp": s:orange})
call s:gui_hi("Pmenu",        {"fg": s:aluminium_hl, "bg": s:orange})
call s:gui_hi("PmenuSel",     {"fg": s:chocolate, "bg": s:aluminium_hl})
call s:gui_hi("PmenuSbar",    {"fg": s:chocolate, "bg": s:aluminium_sd})
call s:gui_hi("PmenuThumb",   {"fg": s:chocolate, "bg": s:aluminium_hl})
call s:gui_hi("TabLine",      {"fg": s:aluminium_hl, "bg": s:slate, "fmt": "underline"})
call s:gui_hi("TabLineSel",   {"fg": s:aluminium_hl, "fmt": "bold"})
call s:gui_hi("TabLineFill",  {"fg": s:slate_sd, "bg": s:aluminium_hl})
call s:gui_hi("CursorColumn", {"fg": s:aluminium_hl, "bg": s:slate_hl})
call s:gui_hi("CursorLine",   {"fg": s:aluminium_hl, "bg": s:slate_hl})
call s:gui_hi("ColorColumn",  {"bg": s:canvas_l})
call s:gui_hi("Cursor",       {"fg": s:slate_sd, "bg": s:aluminium_hl})

call s:gui_hi("StatusLineTerm",   {"fg": s:aluminium_hl, "bg": s:chameleon_sd, "fmt": "bold"})
call s:gui_hi("StatusLineTermNC", {"fg": s:aluminium, "bg": s:chameleon_sd})

" Syntax Common
if exists("g:tango_night") && g:tango_night == 1
    call s:gui_hi("Normal",     {"fg": s:aluminium_sd, "bg": s:canvas})
    call s:gui_hi("Type",       {"fg": s:aluminium_sd, "fmt": "bold"})
    call s:gui_hi("Comment",    {"fg": s:skyblue})
    call s:gui_hi("Constant",   {"fg": s:butter_sd})
    call s:gui_hi("Special",    {"fg": s:plum_sd})
    call s:gui_hi("Identifier", {"fg": s:chameleon_sd})
    call s:gui_hi("Statement",  {"fg": s:chameleon})
    call s:gui_hi("PreProc",    {"fg": s:scarletred_sd})
    call s:gui_hi("Number",     {"fg": s:chocolate_sd})

    call s:gui_hi("Folded",     {"fg": s:aluminium, "bg": s:plum_sd})
    call s:gui_hi("FoldColumn", {"fg": s:aluminium, "bg": s:plum})
else
    call s:gui_hi("Normal",     {"fg": s:aluminium_hl, "bg": s:canvas})
    call s:gui_hi("Type",       {"fg": s:aluminium, "fmt": "bold"})
    call s:gui_hi("Comment",    {"fg": s:cyan})
    call s:gui_hi("Constant",   {"fg": s:butter_sd})
    call s:gui_hi("Special",    {"fg": s:plum})
    call s:gui_hi("Identifier", {"fg": s:chameleon_hl})
    call s:gui_hi("Statement",  {"fg": s:chameleon_sd})
    call s:gui_hi("PreProc",    {"fg": s:scarletred})
    call s:gui_hi("Number",     {"fg": s:skyblue_hl})
endif

" Syntax Special
call s:gui_hi("lCursor",    {"fg": s:slate, "bg": s:chameleon})
call s:gui_hi("MatchParen", {"fg": s:aluminium_hl, "bg": s:skyblue_hl})
call s:gui_hi("Underlined", {"fg": s:skyblue, "fmt": "underline"})
call s:gui_hi("Error",      {"fg": s:aluminium_hl, "bg": s:scarletred_hl})
call s:gui_hi("Todo",       {"fg": s:chameleon_hl, "bg": s:chameleon_sd, "fmt": "bold"})

" }}}

"-----------------------------------------------------------------
" Terminal Color Highlight Settings {{{
"-----------------------------------------------------------------

" 8-color Terminal fallback
if &t_Co == 8
    call s:t_hi("Visual", {"fg": "green", "bg": "grey"})
    call s:t_hi("Folded", {"fg": "grey", "bg": "magenta"})
    call s:t_hi("FoldColumn", {"fg": "grey", "bg": "magenta"})
    call s:t_hi("Title", {"fg": "white", "fmt": "bold"})
    call s:t_hi("ColorColumn", {"bg": "darkblue"})
    call s:t_hi("Pmenu", {"bg": "darkyellow"})
    call s:t_hi("PmenuSel", {"fg": "darkyellow", "bg": "grey"})
    call s:t_hi("PmenuSbar", {"fg": "darkyellow", "bg": "black"})
    call s:t_hi("PmenuThumb", {"fg": "darkyellow", "bg": "grey"})
    call s:t_hi("DiffAdd", {"fg": "white", "bg": "darkgreen"})
    call s:t_hi("DiffChange", {"fg": "white", "bg": "darkblue"})
    call s:t_hi("DiffDelete", {"fg": "red"})
    call s:t_hi("DiffText", {"fg": "white", "bg": "darkyellow"})

    call s:t_hi("NonText", {"fg": "grey", "fmt": "none"})
    call s:t_hi("Normal", {"fg": "grey"})
    call s:t_hi("Type", {"fg": "grey", "fmt": "bold"})
    call s:t_hi("Comment", {"fg": "darkcyan"})
    call s:t_hi("Constant", {"fg": "darkyellow"})
    call s:t_hi("Special", {"fg": "darkmagenta"})
    call s:t_hi("Identifier", {"fg": "green"})
    call s:t_hi("Statement", {"fg": "darkgreen"})
    call s:t_hi("PreProc", {"fg": "darkred"})
    call s:t_hi("Number", {"fg": "blue"})
endif

" }}}

" Make sure the airline redraws
if exists(':AirlineRefresh')
    AirlineRefresh
endif
