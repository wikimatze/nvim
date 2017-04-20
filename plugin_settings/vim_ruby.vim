let ruby_operators    = 1 " create colors for ruby operators
let ruby_space_errors = 1 " mark whitespace characters

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1    " load and evaluate code for completion not in a class definition
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1 " methods and constants in a class are available

