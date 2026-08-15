let g:vimtex_view_method = 'zathura'

" enable special tex folding
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_levelmarker = '➜'
let g:vimtex_fold_types_defaults = {
      \ 'sections': {
      \   'sections': ['chapter', 'section', 'subsection', 'subsubsection'],
      \ },
      \ 'comments': {'enabled': 0},
      \ 'envs': {'enabled': 0},
      \}

" indentation
let g:vimtex_indent_enabled = 1

" toc: don't show preample and number
let g:vimtex_toc_config = {
      \ 'show_numbers': 0,
      \ 'show_preamble': 0,
      \}

" ignore certain warning types
let g:vimtex_quickfix_ignore_filters = ['Underfull', 'Overfull']
let g:vimtex_compiler_latexmk = {
      \ 'continuous': 1,
      \}

let g:vimtex_syntax_conceal_disable = 1 " Disable this to show raw \item and so on
