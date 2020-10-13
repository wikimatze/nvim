" Grab plug.vim if it does not exist
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


call plug#begin('~/.config/nvim/plugged')
if has('python3')
  " Plug 'Shougo/denite.nvim', '67475c7' " call :Denite neoyank, select something in neoyank window, press enter will paste and close the window
  Plug 'Shougo/denite.nvim'            " note from above does not work anymore, what do I have to change?
endif

Plug 'Shougo/neoyank.vim'

call plug#end()


let g:neoyank#limit = 1000
let g:neoyank#file = $HOME.'/.config/nvim/yankring.txt'

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings()
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
endfunction

