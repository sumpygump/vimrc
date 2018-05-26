" ============================================================================
" File:        phpcs.vim
" Description: Vim plugin that performs code sniffs using PHP CodeSniffer (phpcs)
" Maintainer:  Jansen Price <jansen.price at gmail dot com>
" Last Change: 2011-01-30
" License:     http://www.opensource.org/licenses/mit-license.php MIT
" Usage:       Load a PHP file into a buffer and run SniffFile to perform the
"              sniff
" ============================================================================
let s:SniffVersion = '0.9'

let g:SniffStandard = (exists("g:SniffStandard")) ? g:SniffStandard : "Zend"

" Storage for the appended number to keep the buffer names unique
let s:nextBufferNumber = 1

" The name of the Sniff results buffer
let s:BufName = 'Sniff_Results_'

" Main function to sniff the PHP file in the current buffer
function! SniffFile()
    " Get the full path to the filename to sniff
    let t:SniffFileName = expand("%:p")
    let t:SniffFileBuf = bufnr("") 

    if s:getSniffResultsWinNum() != -1
        exec bufwinnr(t:ResultBuf) . "wincmd w"
    else
        exec s:createSniffResultsWin()
    endif

    call s:performSniff()

    call s:bindMappings()
endfunction

" Alternate sniff function to use the cexpr and cwindow
" It is not as elegant, though.
function! SniffCwindow()
    let l:filename=@%
    let l:phpcs_output=system('phpcs --report=csv --standard=' . g:SniffStandard . ' "' . l:filename . '"')
    cexpr l:phpcs_output
    cwindow

    set errorformat=%E\"%f\"\\,%l\\,%c\\,error\\,\"%m\"\\,%*[a-zA-Z.],%W\"%f\"\\,%l\\,%c\\,warning\\,\"%m\"\\,%*[a-zA-Z.],%-GFile\\,Line\\,Column\\,Severity\\,Message\\,Source
endfunction

" Perform the actual sniff command
function! s:performSniff()
    " Clear the buffer (delete all lines)
    exec "%d"

    echomsg "Running phpcs on file..."

    " Call phpcs and put the contents into the buffer
    "silent! exec 'r ! phpcs -v --standard=' . g:SniffStandard . ' "' . t:SniffFileName . '"'
    silent! exec 'r ! qis cs -d "' . t:SniffFileName . '"'
    exec 'normal oPress Enter on error message line to go to error line'
    exec 'normal oPress r to refresh the sniff'
    exec 'normal oPress q to exit this window'

    " Delete the first line (it's blank)
    exec ":1d"

    " Go to the eighth line (this is usually the first error)
    exec ":8"

    silent echomsg "Running phpcs on file... done."
    redraw
endfunction

" Bind mappings to the results buffer
function! s:bindMappings()
    " Pressing enter on a line will go to that line in the file
    nnoremap <silent> <buffer> <CR> :call <SID>gotoErrorLine()<CR>
    nnoremap <silent> <buffer> r :call <SID>performSniff()<CR>
    nnoremap <silent> <buffer> q :close<CR>
endfunction

" Find the line number in the error report for the cursor's current line
" and go to that line in the the buffer with the file being sniffed
function! s:gotoErrorLine()
    " Attempt to find the line number in the error message
    let s:errorLine = matchstr(getline('.'), '\d\+')

    if s:errorLine != ''
        " Switch to the sniff file buffer
        exec bufwinnr(t:SniffFileBuf) . "wincmd w"

        " Go to the line in the error message
        exec ":" . s:errorLine
    endif
endfunction

" Create the new sniff results window
function! s:createSniffResultsWin()
    let t:BufName = s:nextBufferName()

    " Create a new window below or to the right
    rightbelow new

    " Set the name of the buffer
    exec "edit " . t:BufName

    " Set up as a throw away buffer
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=hide

    " Highlight the cursor line
    setlocal cursorline

    " Store the buffer number of the resulting buffer
    let t:ResultBuf = bufnr("")
endfunction

" Get the buffer number of the current results buffer (if exists)
function! s:getSniffResultsWinNum()
    if exists("t:BufName")
        return bufwinnr(t:BufName)
    else
        return -1
    endif
endfunction

" Create the next buffer name
function! s:nextBufferName()
    let name = s:BufName . s:nextBufferNumber
    let s:nextBufferNumber += 1
    return name
endfunction

command! SniffFile call SniffFile()
