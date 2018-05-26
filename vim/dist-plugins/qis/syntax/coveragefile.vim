" Vim syntax file
" Language: Code Coverage File
" Maintainer: Jansen Price <jansen.price@gmail.com>
" Latest Revision: 02 Feb 2011

if exists("b:current_syntax")
    finish
endif

syn match lineExecuted /^\s\+\d\+\s\+\d\+\s:\s/
syn match lineNotExecuted /^\s\+\d\+\s\+0\s:\s/
syn match lineDeadCode /^\s\+\d\+\s\+:\s.*$/

hi def link lineExecuted     Todo
hi def link lineNotExecuted  Error
hi def link lineDeadCode     Comment

let b:current_syntax = "coveragefile"
