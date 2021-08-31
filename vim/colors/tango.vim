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
let s:aluminium_hl  = "#eeeeec"
let s:aluminium     = "#d3d7cf"
let s:aluminium_sd  = "#babdb6"
let s:butter_hl     = "#fce94f"
let s:butter        = "#edd400"
let s:butter_sd     = "#c4a000"
let s:orange_hl     = "#fcaf3e"
let s:orange        = "#f57900"
let s:orange_sd     = "#ce5c00"
let s:chocolate_hl  = "#e9b96e"
let s:chocolate     = "#c17d11"
let s:chocolate_sd  = "#8f5902"
let s:chameleon_hl  = "#8ae234"
let s:chameleon     = "#73d216"
let s:chameleon_sd  = "#4e9a06"
let s:skyblue_hl    = "#729fcf"
let s:skyblue       = "#3465a4"
let s:skyblue_sd    = "#204a87"
let s:plum_hl       = "#ad7fa8"
let s:plum          = "#75507b"
let s:plum_sd       = "#5c3566"
let s:slate_hl      = "#888a85"
let s:slate         = "#555753"
let s:slate_sd      = "#2e3436"
let s:scarletred_hl = "#ef2929"
let s:scarletred    = "#cc0000"
let s:scarletred_sd = "#a40000"

" These are non-standard but look good with tango
let s:skyblue_dark = "#11284a"
let s:skyblue_dusk = "#21385a"
let s:night        = "#1e1e1e"
let s:cyan         = "#06989a"

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
    execute "highlight!" a:group
        \ "guifg=" (has_key(a:style, "fg")  ? a:style.fg  : "NONE")
        \ "guibg=" (has_key(a:style, "bg")  ? a:style.bg  : "NONE")
        \ "guisp=" (has_key(a:style, "sp")  ? a:style.sp  : "NONE")
        \ "gui="   (has_key(a:style, "fmt") ? a:style.fmt : "NONE")
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
