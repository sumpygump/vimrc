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
        let startrev = 'BASE'
    endif

    if a:0 > 1
        let endrev = a:2
    else
        let endrev = 'HEAD'
    endif

    aboveleft vertical new
    let cmd = "svn log -r " . startrev . ":" . endrev

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
    let cmd = "svn diff -r" . s:prevrev . ":" . s:revision
    echom cmd
    silent exec "%!" . cmd
    setlocal ft=diff
endfunction
