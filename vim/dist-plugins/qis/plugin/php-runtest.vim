" ============================================================================
" File:        php-runtest.vim
" Description: Vim plugin that calls phpunit (runtest)
" Maintainer:  Jansen Price <jansen.price at gmail dot com>
" Last Change: 2011-02-02
" License:     http://www.opensource.org/licenses/mit-license.php MIT
" Usage:       Run the command RunTest to run the phpunit tests and call up
"              the code coverage reports and analysis files
" ============================================================================

function! RunTest(path)
    belowright new

    " Set up as a throw away buffer
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=hide

    " Highlight the cursor line
    setlocal cursorline

    if !exists(a:path)
        let l:path = "."
    else
        let l:path = a:path
    endif
    exec "r ! cd tests;./runtest " . l:path . ";tools/generate-clover-report coverage.xml"
    exec ":1d"
    exec ":1"

    call s:bindMappings()
endfunction
command! -n=? RunTest call RunTest('<args>')

function! s:bindMappings()
    nnoremap <silent> <buffer> <CR> :call <SID>openAnalysisFile()<CR>
endfunction

function! s:openAnalysisFile()
    let s:filename = matchstr(getline('.'), '^\f\+')
    echo s:filename

    if s:filename != ''
        edit analysis_1

        " Set up as a throw away buffer
        setlocal noswapfile
        setlocal buftype=nofile
        setlocal bufhidden=hide

        exec "%d"
        exec "r ! cd tests;tools/generate-clover-report coverage.xml " . s:filename
        exec ":1d"
        exec ":1"
        exec ":set ft=coveragefile"
    endif
endfunction
