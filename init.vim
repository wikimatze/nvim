" Grab plug.vim if it does not exist
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" Get thesaurus (need for vim-lexical)
if empty(glob('~/.config/nvim/thesaurus'))
  " create directory
  silent !mkdir ~/.config/nvim/thesaurus
  " get german thesaurus
  silent !wget https://www.openthesaurus.de/export/OpenThesaurus-Textversion.zip -O ~/.config/nvim/thesaurus/mthesaur.zip && unzip ~/.config/nvim/thesaurus/mthesaur.zip -d ~/.config/nvim/thesaurus/
  " get english thesaurus
  silent !wget https://raw.githubusercontent.com/statico/dotfiles/master/.vim/mthes10/mthesaur.txt -O ~/.config/nvim/thesaurus/mthesaur.txt && sed -i 's/,/;/g' ~/.config/nvim/thesaurus/mthesaur.txt
  silent !rm ~/.config/nvim/thesaurus/mthesaur.zip ~/.config/nvim/thesaurus/LICENSE.txt
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
Plug 'alvan/vim-closetag', '6cfc989'
Plug 'christoomey/vim-tmux-navigator', '2fc1ed4'
Plug 'francoiscabrol/ranger.vim', 'b0b8566'
Plug 'tpope/vim-fugitive', 'aac85a2'
" need for closing ranger
Plug 'rbgrouleff/bclose.vim'
Plug 'gregsexton/gitv', { 'commit': 'v1.3.1', 'on': ['Gitv']} " needs fugitive
Plug 'itchyny/lightline.vim', '15509c6'
Plug 'jamessan/vim-gnupg', '5103285'
Plug 'janko-m/vim-test', '6ebbd35'
Plug 'jreybert/vimagit', '1.7.1'
Plug 'junegunn/vader.vim', '9c1d971'
Plug 'lervag/vimtex', '402a3fb'
Plug 'ludovicchabant/vim-gutentags', 'e220e9b'
Plug 'majutsushi/tagbar', '959f487'
Plug 'matze/vim-move', 'fd60f3f'
Plug 'mbbill/undotree', 'ad08a88'
Plug 'mhinz/vim-grepper', '1ec1b33'
Plug 'tpope/vim-markdown', '0b92a7d'
Plug 'reedes/vim-lexical', 'fb42333'
Plug 'reedes/vim-litecorrect', '8d5f233'
Plug 'scrooloose/syntastic', '3.8.0'
Plug 'tpope/vim-surround', 'e49d6c2'
Plug 'tyru/caw.vim', 'ba5d4cc'
Plug 'vim-ruby/vim-ruby', '5b74d40'
Plug 'xolox/vim-misc', '1.17.6'
Plug 'xolox/vim-notes', '0.33.4'

" Plug 'wellle/tmux-complete.vim', '5d371f2'
" Plug 'wikimatze/vim-radio'


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
ru mappings/vim_test.vim                  " <leader>t :TestNearest, <leader>T :TestFile, <leader>a :TestSuite, <leader>l :TestLastVisit, <leader>g :TestVisit

" }}}

