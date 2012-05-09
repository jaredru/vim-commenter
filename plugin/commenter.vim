
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

command! -range Comment   call Commenter#Comment(<line1>, <line2>)
command! -range Uncomment call Commenter#Uncomment(<line1>, <line2>)

"
" Mappings
"

if !hasmapto(":Comment<CR>")
    noremap  <unique> <silent> <C-K>      :Comment<CR>
    inoremap <unique> <silent> <C-K> <C-O>:Comment<CR>
    vnoremap <unique> <silent> <C-K>      :Comment<CR>gv
endif

if !hasmapto(":Uncomment<CR>")
    noremap  <unique> <silent> <C-J>      :Uncomment<CR>
    inoremap <unique> <silent> <C-J> <C-O>:Uncomment<CR>
    vnoremap <unique> <silent> <C-J>      :Uncomment<CR>gv
endif

" vim:ft=vim:ff=unix
