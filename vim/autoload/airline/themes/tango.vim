"-----------------------------------------------------------------
"   _____
"  |_   _|_ _ _ __   __ _  ___
"    | |/ _` | '_ \ / _` |/ _ \
"    | | (_| | | | | (_| | (_) |
"    |_|\__,_|_| |_|\__, |\___/
"                   |___/
"-----------------------------------------------------------------
" Theme:   Tango
" Version: 1.0.0
" License: MIT
" Author:  Jansen Price
"-----------------------------------------------------------------
" Uses the Tango color palette. Attempted to make a clear
" delineation between active pane in terminal
"-----------------------------------------------------------------

let g:airline#themes#tango#palette = {}
let g:airline_symbols.branch = '%'
let g:airline_symbols.notexists = '~'

function! airline#themes#tango#refresh()

    " Gui colors
    let s:gui_butter = "#edd400"
    let s:gui_butter_highlight = "#fce94f"
    let s:gui_orange = "#f57900"
    let s:gui_chocolate = "#c17d11"
    let s:gui_chameleon = "#73d216"
    let s:gui_chameleon_shadow = "#4e9a06"
    let s:gui_skyblue = "#3465a4"
    let s:gui_plum = "#75507b"
    let s:gui_scarletred = "#cc0000"
    let s:gui_aluminium = "#d3d7cf"
    let s:gui_aluminium_highlight = "#eeeeec"
    let s:gui_aluminium_dark = "#555753"
    let s:gui_white = "#ffffff"

    " Terminal colors
    let s:term_red = 1
    let s:term_green = 2
    let s:term_yellow = 3
    let s:term_blue = 4
    let s:term_purple = 5
    let s:term_cyan = 6
    let s:term_white = 7
    let s:term_black = 0
    let s:term_grey = 8

    " Default modified
    let s:modified = {
        \ 'airline_b': [ s:gui_butter_highlight, '', s:term_red, '' ],
        \ 'airline_c': [ s:gui_butter_highlight, '', s:term_red, '' ],
        \ }

    " Accents
    let g:airline#themes#tango#palette.accents = {
        \ 'red': [ s:gui_scarletred, '', s:term_red, '', '' ],
        \ 'green': [ s:gui_chameleon, '', s:term_green, '', '' ],
        \ 'blue': [ s:gui_skyblue, '', s:term_blue, '', '' ],
        \ 'yellow': [ s:gui_butter, '', s:term_yellow, '', '' ],
        \ 'orange': [ s:gui_orange, '', s:term_cyan, '', '' ],
        \ 'purple': [ s:gui_plum, '', s:term_purple, '', '' ],
        \ }

    " Warning / Error
    let s:warning = [ s:gui_white, s:gui_orange, s:term_white, s:term_yellow, 'bold' ]
    let s:error = [ s:gui_white, s:gui_scarletred, s:term_white, s:term_red ]

    " Inactive mode
    let s:IA = [ s:gui_chameleon_shadow, s:gui_aluminium_highlight, s:term_green, s:term_white ]
    let g:airline#themes#tango#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
    let g:airline#themes#tango#palette.inactive_modified = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

    " Normal mode
    "          [ guifg, guibg, ctermfg, ctermbg, opts ]
    let s:N1 = [ s:gui_aluminium_dark, s:gui_chameleon, s:term_grey, s:term_green ]
    let s:N2 = [ s:gui_white, s:gui_chameleon_shadow, s:term_grey, s:term_green ]
    let s:N3 = [ s:gui_white, s:gui_chameleon_shadow, s:term_grey, s:term_green ]
    let g:airline#themes#tango#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
    let g:airline#themes#tango#palette.normal_modified = s:modified
    let g:airline#themes#tango#palette.normal.airline_warning = s:warning
    let g:airline#themes#tango#palette.normal.airline_error = s:error

    " Insert mode
    let s:I1 = [ s:gui_white, s:gui_plum, s:term_white, s:term_green ]
    let s:I2 = [ s:gui_white, s:gui_chameleon_shadow, s:term_grey, s:term_green ]
    let s:I3 = [ s:gui_white, s:gui_chameleon_shadow, s:term_grey, s:term_green ]
    let g:airline#themes#tango#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
    let g:airline#themes#tango#palette.insert_modified = s:modified
    let g:airline#themes#tango#palette.insert.airline_warning = s:warning
    let g:airline#themes#tango#palette.insert.airline_error = s:error

    " Visual mode
    let s:V1 = [ s:gui_white, s:gui_skyblue, s:term_white, s:term_blue ]
    let s:V2 = [ s:gui_white, s:gui_chameleon_shadow, s:term_black, s:term_green ]
    let s:V3 = [ s:gui_white, s:gui_chameleon_shadow, s:term_black, s:term_green ]
    let g:airline#themes#tango#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
    let g:airline#themes#tango#palette.visual_modified = s:modified
    let g:airline#themes#tango#palette.insert.airline_warning = s:warning
    let g:airline#themes#tango#palette.insert.airline_error = s:error

    " Replace mode
    let s:R1 = [ s:gui_white, s:gui_chocolate, s:term_white, s:term_red ]
    let s:R2 = [ s:gui_white, s:gui_chameleon_shadow, s:term_white, s:term_green ]
    let s:R3 = [ s:gui_white, s:gui_chameleon_shadow, s:term_white, s:term_green ]
    let g:airline#themes#tango#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
    let g:airline#themes#tango#palette.replace_modified = s:modified
    let g:airline#themes#tango#palette.insert.airline_warning = s:warning
    let g:airline#themes#tango#palette.insert.airline_error = s:error

endfunction

call airline#themes#tango#refresh()
