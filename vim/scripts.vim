" Scripts file that gets run from filetype.vim
"
" Only do the rest when the FileType autocommand has not been triggered yet.
if did_filetype()
    finish
endif

let s:line1 = getline(1)

" Detect svnlog file
if s:line1 =~ '/^-\{72\}$/'
    setfiletype svnlog
endif
