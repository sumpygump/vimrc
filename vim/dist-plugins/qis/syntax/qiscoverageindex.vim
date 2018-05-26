" Vim syntax file
" Language: Code Coverage File
" Maintainer: Jansen Price <jansen.price@gmail.com>
" Latest Revision: 15 Aug 2012

if exists("b:current_syntax")
    finish
endif

syn match percentLineLow0 /\[ .\+$/
syn match percentLineLow1 /\[\* .\+$/
syn match percentLineLow2 /\[\*\* .\+$/
syn match percentLineLow3 /\[\*\*\* .\+$/
syn match percentLineMed4 /\[\*\*\*\* .\+$/
syn match percentLineMed5 /\[\*\*\*\*\* .\+$/
syn match percentLineMed6 /\[\*\*\*\*\*\* .\+$/
syn match percentLineMed7 /\[\*\*\*\*\*\*\* .\+$/
syn match percentLineHigh8 /\[\*\*\*\*\*\*\*\* .\+$/
syn match percentLineHigh9 /\[\*\*\*\*\*\*\*\*\* .\+$/
syn match percentLineHigh10 /\[\*\*\*\*\*\*\*\*\*\*.\+$/

" Red
hi def link percentLineLow0 PreProc
hi def link percentLineLow1 PreProc
hi def link percentLineLow2 PreProc
hi def link percentLineLow3 PreProc

" Orange
hi def link percentLineMed4 Constant
hi def link percentLineMed5 Constant
hi def link percentLineMed6 Constant
hi def link percentLineMed7 Constant

" Green
hi def link percentLineHigh8 Statement
hi def link percentLineHigh9 Statement
hi def link percentLineHigh10 Statement

let b:current_syntax = "qiscoverageindex"
