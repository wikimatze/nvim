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


" General settings {{{

let mapleader = "," " change the leader to be a comma vs. backslash if not given

" }}}

" Plugin settings {{{

ru! plugin_settings/*.vim

" }}}
" Mappings {{{

ru mappings/esc_with_jk.vim               " emulate ESC with jk
ru mappings/gitv.vim                      " ,gv (global view) and ,gV (file specific commits) for starting the browser
ru mappings/neoyank.vim                   " <leader>y search the yank history
ru mappings/ranger.vim                    " F2 will call :Ranger

" }}}

