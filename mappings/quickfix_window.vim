augroup myquickfix
  autocmd BufReadPost quickfix nn q :cclose<CR>
  autocmd BufReadPost terminal nn q :lclose<CR>
augroup END
