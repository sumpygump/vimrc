" ============================================================================
" File:        svndiff.vim
" Description: Vim plugin for the `svn diff' command
" Maintainer:  Jansen Price <jansen.price at gmail dot com>
" Last Change: 2011-11-15
" License:     http://www.opensource.org/licenses/mit-license.php MIT
" Usage:       Run SvnDiff (revision number) to open a pane to the left with a
"              diff of the current file and that revision
" ============================================================================
if exists("loaded_svndiff") || &compatible
    finish
endif
let loaded_svndiff = 1

function! s:SvnDiff(...)
    if a:0 > 0
        let rev = a:1
    else
        let rev = 'BASE'
    endif

    echom 'diff against revision: ' . rev

    let ftype = &filetype

    " Check out the revision to a temp file
    let tmpfile = tempname()
    let cmd = "svn cat -r " . rev . " " . expand("%:p") . " > " . tmpfile
    let cmd_output = system(cmd)
    if v:shell_error && cmd_output != ""
        echohl WarningMsg | echon cmd_output
        return
    endif

    " Begin diff
    exe "vert diffsplit " . tmpfile
    exe "set filetype=" . ftype
    set foldmethod=diff
    wincmd l
:endfunction

command! -nargs=? SvnDiff :call s:SvnDiff(<f-args>)
