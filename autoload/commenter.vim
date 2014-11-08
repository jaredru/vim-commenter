
""""""""""""""""""""""""""""""""""""""""""""""""""
" Commenter
"

"
" Functions
"

function! s:commentParts()
    return split(substitute(substitute(&commentstring, '%s', ' %s', ''), '%s\ze.', '%s ', ''), '%s', 1)
endfunction

function! commenter#comment(first, last)
    " first we figure out how much whitespace to use.
    " we want it aligned with the least indented line selected.
    let whitespace = 1000000

    for i in range(a:first, a:last)
        let line = getline(i)

        " we don't care about empty lines
        if strlen(line)
            let current    = strlen(matchstr(line, '^\s*'))
            let whitespace = min([whitespace, current])

            " break if we reach an unindented line
            if !whitespace
                break
            endif
        endif
    endfor

    " apply the comment string to every non-empty line
    let [pre, post] = s:commentParts()

    for i in range(a:first, a:last)
        let line = getline(i)

        if strlen(line)
            call setline(i, substitute(line, '\v^\s{' . whitespace . '}\zs.*', '\=pre . submatch(0) . post', ''))
        endif
    endfor
endfunction

function! commenter#uncomment(first, last)
    " remove the comment string from every line that matches it
    let [pre, post] = s:commentParts()

    for i in range(a:first, a:last)
        let line = getline(i)
        let uncommented = substitute(line, '\V' . pre . '\(\.\{-}\)\s\*' . post . '\s\*\$', '\1', '')

        if line != uncommented
            call setline(i, uncommented)
        endif
    endfor
endfunction

" vim:ft=vim:ff=unix

