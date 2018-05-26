" Vim syntax file
" Language: Subversion Status Output
" Maintainer: Jansen Price <jansen.price@gmail.com>
" Latest Revision: 25 Mar 2011

if exists("b:current_syntax")
    finish
endif

syn match lineUpdate /^U.*$/
syn match lineAdd /^A.*$/
syn match lineConflict /^C.*$/

hi def link lineUpdate Comment
hi def link lineAdd Todo
hi def link lineConflict Error

let b:current_syntax = "svnstatus"
