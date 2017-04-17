" Grab plug.vim if it does not exist
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'DataWraith/auto_mkdir', 'v1.0.0'
Plug 'cohama/lexima.vim', '85cfff9'
Plug 'Shougo/neosnippet.vim', 'affc71b'
Plug 'Shougo/neoyank.vim', 'ad56eca'
Plug 'Shougo/unite.vim', '97e63411'
" Seems like deunite don't need this plugin
"Plug 'Shougo/vimproc.vim', { 'commit': '25cb83f', 'do': 'make' }

" Initialize plugin system
call plug#end()
