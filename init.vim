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

set number                                  " display line numbers
set noerrorbells                            " turn of nasty error sounds
set autoindent                              " Copy indent from current line when starting a new line
set autoread                                " automatically read a file that has changed on disk
set autowrite                               " automatically write a file when moving to another buffer
set showbreak=↪                             " show the symbol for wrapped lines
set nowarn                                  " do not warn, when shell command update the file you edit in Vim
set backspace=indent,eol,start              " allow backspacing over everything in insert mode
set numberwidth=2                           " using only 2 column for number line presentation
set splitbelow                              " splitting a window will put the new window below the current one
set splitright                              " splitting a window will put the new window right the current one
set spelllang=en_us                         " default language for spell checker
set spellfile=$HOME/.config/nvim/spell/en.utf-8.add " spell file for additional correct English words
set spellsuggest=best,5                     " only display the 5 best suggestions
set infercase                               " autocompletion in Insert Mode is case sensitive
set shortmess+=I                            " don't show startup message when opening Vim without a file
set noautochdir                             " don't change the current working directory when opening a new file
set cpoptions+=$                            " `cw` put a $ at the end instead of pure deletion
set completeopt=longest,menuone,preview,    " modes for auto completion popup
                                            " longest - only insert the longest common text of the matches.
                                            " menuone - use the popup menu also when there is only one match.
                                            " preview - show extra information about the currently selected
set tabstop=2                               " how many columns a tab counts
set shiftwidth=2                            " how many columns text is indented with the indent operations (<< and >>)
set softtabstop=2                           " how many columns
set expandtab                               " hitting tab in insert mode will produce number in spaces instead of tabs
set fillchars=""                            " get rid of silly characters in separators in the CMD
set ignorecase                              " case insensitive search
set smartcase                               " canceling out ignore for uppercase letter in search
set nohlsearch
set noswapfile                              " don't save swap files

" external tool when using grep
if executable('pt')
  set grepprg=pt
elseif executable('ag')
  set grepprg=ag
endif

" Remove Vim' automatic comment prefixing (http://tilvim.com/2013/12/30/remove-comment-prefix-2.html)
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

let mapleader = "," " change the leader to be a comma vs. backslash if not given

let &scrolloff=999-&scrolloff " current view is always centered


let file = expand("%")
if file=~"padrinocasts.md"
    colorscheme delek
else
    colorscheme github
endif

set tags=tags,./tags,gems.tags,./gems.tags

" }}}
" Backups {{{

if !isdirectory($HOME . '/.config/nvim/backup')
  call mkdir($HOME . '/.config/nvim/backup')
endif

set backupext=~                 " backup file extension
set backupdir=$HOME/.config/nvim/backup " directory of backups
set backupcopy=yes              " keep attributes of the original file
set backup                      " save files after close
set writebackup                 " make a backup of the original file when writing

" }}}
" Settings to let netrw looks like a project file browser {{{
" Inspiration from https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" }}}
" Detect YAML front matter parts in markdown files as comments {{{

autocmd BufNewFile,BufRead *.md syntax match Comment /\%^---\_.\{-}---$/

" }}}
" Settings for displaying list chars {{{

" trails - white spaces
" extends: shows when a file name goes out the view (you have to scroll right in NERDTree)
" precedes: shows when a file name goes out the view (you have to scroll left like in NERDTree)
" nbsp: character to show for a non-breakable space
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:.,nbsp:~
set list " enable the predefined symbols for tabs, trails, ...

" }}}
" Settings for wildmenu completion {{{

if has("wildmenu")
  set wildmenu                           " enable a navigable list of suggestions
  set wildmode=full                      " zsh full-match, starts over with first match after last match reached
  set wig+=.git,.hg,.svn                 " version control
  set wig+=*.bmp,*.gif,*.ico,*.jpg,*.png " images
  set wig+=*.aux,*.out,*.toc             " LaTeX intermediate files
  set wig+=.DS_Store                     " Mac
  set wig+=*~,*.swp,*.tmp                " tmp and backup files
endif

" }}}
" Functions {{{
" Trailing whitespace removal {{{
fu! <SID>StripTrailingWhitespaces()
  " preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endf

" when file is saved, call the function to remove trailing whitespace
au BufWritePre * :call <SID>StripTrailingWhitespaces()
" }}}
" Insert date in the form yyyy-mm-dd at the end of a line, <F5> {{{
fu! InsertSpaceDate()
  let @x = " "
  let @x = @x . strftime("%Y-%m-%d")
  normal! "xp
  silent exec line(".") . "s/TODO/DONE"
endf

no <silent> <F5> $:call InsertSpaceDate() <CR>
ru functions/insert_spacedate.vim
" }}}
" Close all buffers except the current one :Bdeleteonly {{{
" Found solution under
" http://vim.1045645.n5.nabble.com/Close-all-buffers-except-the-one-you-re-in-td1183357.html
function! Buflist()
    redir => bufnames
    silent ls
    redir END
    let list = []
    for i in split(bufnames, "\n")
        let buf = split(i, '"' )
        call add(list, buf[-2])
    endfor
    return list
endfunction

function! Bdeleteonly()
    let list = filter(Buflist(), 'v:val != bufname("%")')
    for buffer in list
        exec "bdelete ".buffer
    endfor
endfunction

command! BdelOnly :silent call Bdeleteonly()
" }}}
" }}}
" Plugin settings {{{

ru! plugin_settings/*.vim
ru macros/matchit.vim " enable better matching for % command

" }}}
" Mappings {{{

ru mappings/commandline.vim               " <C-b> go char left, <C-f> go char right, <C-p> go previews command, <C-n> go next command
ru mappings/copy_paste_clipboard.vim      " <C-c> for copy, <leader-C-v> to paste from clipboard in normal mode
ru mappings/esc_with_jk.vim               " emulate ESC with jk
ru mappings/gitv.vim                      " ,gv (global view) and ,gV (file specific commits) for starting the browser
ru mappings/keep_cursor_joining_lines.vim " indent joining lines the right way
ru mappings/moving_wrapped_lines.vim      " Use hjkl in wrapped-lined files
ru mappings/neoyank.vim                   " <leader>y search the yank history
ru mappings/pry.vim                       " ,pi toggles 'binding pry'
ru mappings/quickediting.vim              " ,ba; ,bm; ,br; ,ev to edit files of vim repos
ru mappings/ranger.vim                    " F2 will call :Ranger
ru mappings/vim_test.vim                  " <leader>t :TestNearest, <leader>T :TestFile, <leader>a :TestSuite, <leader>l :TestLastVisit, <leader>g :TestVisit

" }}}

