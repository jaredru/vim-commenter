
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

" unfortunately we can't utilize the range support on our functions, because
" it will always move our cursor to the first character of the first line of
" the range after executing it.
command! -range Comment   call Commenter#Comment(<line1>, <line2>)
command! -range Uncomment call Commenter#Uncomment(<line1>, <line2>)

"
" Mappings
"

if !hasmapto(":Comment<CR>")
    nnoremap <unique> <silent> <C-K>      :Comment<CR>
    inoremap <unique> <silent> <C-K> <C-O>:Comment<CR>
    vnoremap <unique> <silent> <C-K>      :Comment<CR>gv
endif

if !hasmapto(":Uncomment<CR>")
    nnoremap <unique> <silent> <C-J>      :Uncomment<CR>
    inoremap <unique> <silent> <C-J> <C-O>:Uncomment<CR>
    vnoremap <unique> <silent> <C-J>      :Uncomment<CR>gv
endif

" vim:ft=vim:ff=unix
