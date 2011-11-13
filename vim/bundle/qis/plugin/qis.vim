" ============================================================================
" File:        qis.vim
" Description: Vim plugin for QIS (Quantal Integration System)
" Maintainer:  Jansen Price <jansen.price at gmail dot com>
" Last Change: 2011-03-25
" License:     http://www.opensource.org/licenses/mit-license.php MIT
" Usage:       Run qis command to see the code coverage
"              reports and analysis files
" ============================================================================
let s:Version = '1.0.8'

" Storage for the appended number to keep the buffer names unique
let s:nextBufferNumber = 1

" Qis Test / Coverage {{{
" The name of the Sniff results buffer
let s:CoverageBufName = 'Qis_Coverage'

function! QisCoverage()
    if s:getCoverageIndexWinNum() != -1
        exec bufwinnr(t:CoverageIndexResultBuf) . "wincmd w"
    else
        " Make an empty horizontal split
        aboveleft new
        wincmd j
        exec s:CreateCoverageIndexWin()
    endif

    call s:GetCoverageIndex()
    call s:bindMappings()
endfunction
command! QisCoverage call QisCoverage()

function! s:GetCoverageIndex()
    silent exec "%!qis coverage"
    normal 1G
    " Go to the line number we were at last time we ran the coverage report
    exec "normal " . t:coverageIndexLineNumber . "G"
endfunction

function! s:RunTest()
    silent exec "%!qis test"
    normal 1G
endfunction

function! s:RunTestSingle()
    " Keep track of the line
    let t:coverageIndexLineNumber = line('.')

    " Find the filename for which to run the test
    let s:filename = matchstr(getline('.'), '^\f\+')
    exec "%!qis test " . s:filename . "Test"
    normal 1G
endfunction

function! s:bindMappings()
    nnoremap <silent> <buffer> <CR> :call <SID>openAnalysisFile()<CR>
    nnoremap <silent> <buffer> t :call <SID>RunTest()<CR>
    nnoremap <silent> <buffer> T :call <SID>RunTestSingle()<CR>
    nnoremap <silent> <buffer> r :call <SID>GetCoverageIndex()<CR>
    nnoremap <silent> <buffer> q :close<CR>
endfunction

function! s:openAnalysisFile()
    let t:coverageIndexLineNumber = line('.')
    let s:filename = matchstr(getline('.'), '^\f\+')

    if !exists("t:CoverageFileBufName")
        let t:activeCoverageFile = s:filename
    endif

    if s:filename != ''
        wincmd k
        exec "edit " . s:filename
        let file = t:activeCoverageFile

        if s:filename == file
            let t:activeCoverageFileLineNumber = line('.')
        else
            let t:activeCoverageFileLineNumber = 1
        endif
        
        exec "normal " . t:activeCoverageFileLineNumber . "G"

        set nowrap

        if s:getCoverageFileWinNum() != -1
            exec bufwinnr(t:CoverageFileResultBuf) . "wincmd w"
        else
            exec s:CreateCoverageFileWin()
        endif
        silent vertical resize 16

        silent exec "%!qis coverage --quiet " . s:filename
        exec "normal " . t:activeCoverageFileLineNumber . "G"
        set scrollbind
        wincmd l
        set scrollbind
        syncbind
        let t:activeCoverageFile = s:filename
    endif
endfunction

function! s:CreateCoverageIndexWin()
    let t:CoverageIndexBufName = s:nextCoverageBufferName()

    vsplit
    wincmd l
    exec "edit " . t:CoverageIndexBufName

    " Set up as a throw away buffer
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=hide

    " Highlight the cursor line
    setlocal cursorline

    " Store line 11 as the line at which to start
    " (the first file in the report is at line 11)
    let t:coverageIndexLineNumber = 11

    " Store the buffer number of the resulting buffer
    let t:CoverageIndexResultBuf = bufnr("")
endfunction

function! s:CreateCoverageFileWin()
    let t:CoverageFileBufName = s:nextCoverageBufferName()

    vsplit
    exec "edit " . t:CoverageFileBufName

    " Setup as a throw away buffer
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=hide

    " Setup some coveragefile settings
    setlocal statusline=[%n]
    setlocal nowrap
    setlocal nonumber
    setlocal ft=coveragefile
    setlocal winwidth=16

    " Store the buffer number of the resulting buffer
    let t:CoverageFileResultBuf = bufnr("")
endfunction

" Get the buffer number of the current index buffer (if exists)
function! s:getCoverageIndexWinNum()
    if exists("t:CoverageIndexBufName")
        return bufwinnr(t:CoverageIndexBufName)
    else
        return -1
    endif
endfunction

" Get the buffer number of the current results buffer (if exists)
function! s:getCoverageFileWinNum()
    if exists("t:CoverageFileBufName")
        return bufwinnr(t:CoverageFileBufName)
    else
        return -1
    endif
endfunction

" Create the next buffer name
function! s:nextCoverageBufferName()
    let name = s:CoverageBufName . s:nextBufferNumber
    let s:nextBufferNumber += 1
    return name
endfunction
" }}}

" Qis codingstandard {{{
let s:CsBufName = 'Qis_Codingstandard'

function! QisCs()
    if s:getCsIndexWinNum() != -1
        exec bufwinnr(t:CsIndexResultBuf) . "wincmd w"
    else
        exec s:CreateCsIndexWin()
    endif

    call s:GetCsIndex()
endfunction
command! QisCs call QisCs()

function! s:GetCsIndex()
    silent exec "%!qis cs --list"
    normal 1G

    " Go to the line number we were at last time we ran the cs report
    exec "normal " . t:csIndexLineNumber . "G"
    call s:bindCsIndexMappings()
endfunction

function! s:RunCs()
    silent exec "%!qis cs -d"
    normal 1G

    call s:bindCsMappings()
endfunction

function! s:bindCsIndexMappings()
    nnoremap <silent> <buffer> <CR> :call <SID>openCsFile()<CR>
    nnoremap <silent> <buffer> t :call <SID>RunCs()<CR>
    nnoremap <silent> <buffer> T :call <SID>RunCsSingle()<CR>
    nnoremap <silent> <buffer> r :call <SID>GetCsIndex()<CR>
    nnoremap <silent> <buffer> q :close<CR>
endfunction

function! s:bindCsFileMappings()
    nnoremap <silent> <buffer> <CR> :call <SID>gotoErrorLine()<CR>
    nnoremap <silent> <buffer> t :call <SID>GetCsIndex()<CR>
    nnoremap <silent> <buffer> r :call <SID>performSniff()<CR>
    nnoremap <silent> <buffer> q :close<CR>
endfunction

function! s:openCsFile()
    let t:csIndexLineNumber = line('.')
    let s:filename = matchstr(getline('.'), '\f\+')

    if !exists("t:CsFileBufName")
        let t:activeCsFile = s:filename
    endif

    if s:filename != ''
        silent exec "%!qis cs --quiet " . s:filename
        wincmd h
        exec "edit " . s:filename
        wincmd l

        normal 8G

        let t:activeCsFile = s:filename
        call s:bindCsFileMappings()
    endif
endfunction

function! s:performSniff()
    silent exec "%!qis cs --quiet " . t:activeCsFile
    normal 8G
endfunction

" Find the line number in the error report for the cursor's current line
" and go to that line in the the buffer with the file being sniffed
function! s:gotoErrorLine()
    " Attempt to find the line number in the error message
    let s:errorLine = matchstr(getline('.'), '\d\+')

    if s:errorLine != ''
        " Switch to the sniff file buffer
        wincmd h

        " Go to the line in the error message
        exec "normal " . s:errorLine . "Gzz"
    endif
endfunction

function! s:CreateCsIndexWin()
    let t:CsIndexBufName = s:nextCsBufferName()

    vsplit
    wincmd l
    exec "edit " . t:CsIndexBufName

    " Set up as a throw away buffer
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=hide

    " Highlight the cursor line
    setlocal cursorline

    " Don't wrap this buffer
    setlocal nowrap

    " Store line 8 as the line at which to start
    " (the first file in the report is at line 8)
    let t:csIndexLineNumber = 8

    " Store the buffer number of the resulting buffer
    let t:CsIndexResultBuf = bufnr("")
endfunction

" Get the buffer number of the current index buffer (if exists)
function! s:getCsIndexWinNum()
    if exists("t:CsIndexBufName")
        return bufwinnr(t:CsIndexBufName)
    else
        return -1
    endif
endfunction

" Create the next buffer name
function! s:nextCsBufferName()
    let name = s:CsBufName . s:nextBufferNumber
    let s:nextBufferNumber += 1
    return name
endfunction
" }}}
