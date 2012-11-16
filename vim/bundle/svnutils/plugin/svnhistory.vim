" ============================================================================
" File:        svnhistory.vim
" Description: Vim plugin for svn history
" Maintainer:  Jansen Price <jansen.price at gmail dot com>
" Last Change: 2012-02-22
" License:     http://www.opensource.org/licenses/mit-license.php MIT
" Usage:       Run SvnHistory (revision number) to open a pane to the left with an
"              SVN log.
" ============================================================================
if exists("loaded_svnhistory") || &compatible
    finish
endif
let loaded_svnhistory = 1

function! s:SvnHistory(...)
    echom a:0
    if a:0 > 0
        let startrev = a:1
    else
        let startrev = '1'
    endif

    if a:0 > 1
        let endrev = a:2
    else
        let endrev = 'HEAD'
    endif

    aboveleft vertical new
    let cmd = "svn log -v -r" . startrev . ":" . endrev

    echom cmd
    silent exec "%!" . cmd
    call s:bindMappings()
    setlocal ft=svnlog
    setlocal cursorline
    setlocal nowrap
endfunction

command! -nargs=? SvnHistory :call s:SvnHistory(<f-args>)

function! s:bindMappings()
    nnoremap <silent> <buffer> <CR> :call <SID>openDiff()<CR>
endfunction

function! s:openDiff()
    let t:logLineNumber = line('.')
    let s:revision = matchstr(getline('.'), '^r[0-9]*')
    let s:revision = strpart(s:revision, 1)
    let s:prevrev = (str2nr(s:revision)) - 1

    wincmd l
    exec "edit " . s:prevrev . ":" . s:revision

    " Setup as a throw away buffer
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=hide
    set readonly

    let cmd = "svn diff -r" . s:prevrev . ":" . s:revision
    echom cmd
    silent exec "%!" . cmd

    setlocal ft=diff
endfunction

" This is a different way of doing it. You have a svn log file open and it
" allows you to press enter on the lines with rXXX and it will open the diff in
" a window below
command! EnableSvnLogDiff :call s:enableSvnLogDiff()

function! s:enableSvnLogDiff()
    belowright new
    wincmd k
    call s:bindBelowMappings()
endfunction

function! s:bindBelowMappings()
    nnoremap <silent> <buffer> <CR> :call <SID>openBelowDiff()<CR>
endfunction

function! s:openBelowDiff()
    let t:logLineNumber = line('.')
    let s:revision = matchstr(getline('.'), '^r[0-9]*')
    let s:revision = strpart(s:revision, 1)
    let s:prevrev = (str2nr(s:revision)) - 1

    wincmd j
    exec "edit " . s:prevrev . ":" . s:revision

    " Setup as a throw away buffer
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=hide
    set readonly

    " Suppress stderr to clean up error message output prior to the diff
    let cmd = "svn diff -r" . s:prevrev . ":" . s:revision . " 2>/dev/null"
    "echom cmd
    silent exec "silent %!" . cmd

    setlocal ft=diff
endfunction
