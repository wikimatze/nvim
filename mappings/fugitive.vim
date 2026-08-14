" Restore q to quit fugitive buffers (like gq)
function! s:FugitiveQuit()
  if bufnr('$') == 1
    quit
  else
    bdelete
  endif
endfunction

autocmd FileType fugitive,fugitiveblame nnoremap <buffer> <silent> q :<C-U>call <SID>FugitiveQuit()<CR>

