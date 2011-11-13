if exists("loaded_svndiff") || &compatible
    finish
endif
let loaded_svndiff = 1

command! -nargs=? SVNDiff :call s:Svndiff(<f-args>)

function! s:Svndiff(...)
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

endfunction
