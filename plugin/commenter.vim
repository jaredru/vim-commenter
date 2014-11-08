
""""""""""""""""""""""""""""""""""""""""""""""""""
" Commenter
"

if exists("loaded_commenter")
    finish
endif
let g:loaded_commenter = 1

"
" Commands
"

command! -range Comment   call commenter#comment(<line1>, <line2>)
command! -range Uncomment call commenter#uncomment(<line1>, <line2>)

" vim:ft=vim:ff=unix

