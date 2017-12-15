cnoremap <c-n> <down>
cnoremap <c-p> <up>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

command! GrepRuby Grepper -grepprg grep -rn --include=\*.rb $* .
" case-insensitive with -i
command! GrepMarkdown Grepper -grepprg grep -rni --include=\*.md $* .
" case-sensitive
command! GrepMarkdowns Grepper -grepprg grep -rn --include=\*.md $* .

