
""""""""""""""""""""""""""""""""""""""""""""""""""
" Commenter
"

"
" Functions
"

function! Commenter#Comment(first, last)
    let whitespaces = []

    " first we figure out how much whitespace to use.
    " we want it aligned with the leasted indented line selected.
    for i in range(a:first, a:last)
        let line = getline(i)

        if strlen(line)
            call add(whitespaces, strlen(matchstr(getline(i), '^\s*')))
        endif
    endfor

    " our whitespace will be the minimum of the valid lines
    let whitespace = min(whitespaces)

    " break the comment string into pre and post parts
    let [pre, post] = split(substitute(substitute(&commentstring, '%s', ' %s', ''), '%s\ze.\+', '%s ', ''), '%s', 1)

    " apply it to every non-empty line
    for i in range(a:first, a:last)
        let line = getline(i)

        if strlen(line)
            call setline(i, substitute(line, '\v^\s{' . whitespace . '}\zs.*', '\=pre . submatch(0) . post', ''))
        endif
    endfor
endfunction

function! Commenter#Uncomment(first, last)
    " break the comment string into pre and post parts
    let [pre, post] = split(substitute(substitute(&commentstring, '%s', ' %s', ''), '%s\ze.\+', '%s ', ''), '%s', 1)

    " remove it from every line that matches it
    for i in range(a:first, a:last)
        let line = getline(i)
        let uncommented = substitute(line, '\V' . pre . '\(\.\{-}\)\s\*' . post . '\s\*\$', '\1', '')

        if line != uncommented
            call setline(i, uncommented)
        endif
    endfor
endfunction

" vim:ft=vim:ff=unix