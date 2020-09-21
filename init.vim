scriptencoding utf-8

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
  silent !wget https://ia800205.us.archive.org/7/items/mobythesauruslis03202gut/mthesaur.txt -O ~/.config/nvim/thesaurus/mthesaur.txt && sed -i 's/,/;/g' ~/.config/nvim/thesaurus/mthesaur.txt
  silent !rm ~/.config/nvim/thesaurus/mthesaur.zip ~/.config/nvim/thesaurus/LICENSE.txt
endif

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'andymass/vim-matchup', '9e0b6f3'
Plug 'brooth/far.vim', 'aaf7b25'
Plug 'christoomey/vim-tmux-navigator', '8fdf782'
Plug 'cohama/lexima.vim', '89bf4d'
Plug 'francoiscabrol/ranger.vim', '91e82de'
Plug 'itchyny/lightline.vim', '6fb3ddd'
Plug 'jamessan/vim-gnupg', '90b86c5'
Plug 'janko-m/vim-test', '795f164'
Plug 'tpope/vim-dispatch', 'fe6a343'
Plug 'jreybert/vimagit', {'commit': 'bf7b16e', 'on': ['Magit'] }
Plug 'lervag/vimtex', {'commit': 'b31b49f', 'for': 'tex' }
Plug 'ludovicchabant/vim-gutentags', '8e69652'
Plug 'majutsushi/tagbar', 'f579273'
Plug 'matze/vim-move', '1460aa9'
Plug 'mbbill/undotree', 'be23eac'
Plug 'mhinz/vim-grepper', 'e9004ce'
Plug 'rbgrouleff/bclose.vim'
Plug 'reedes/vim-lexical', '94c8541'
Plug 'tpope/vim-fugitive', '511d303'
Plug 'tpope/vim-markdown', {'commit': '276524e', 'for': 'markdown' }
Plug 'tpope/vim-surround', 'f51a26d'
Plug 'tyru/caw.vim', 'd4a4a73'
Plug 'vim-ruby/vim-ruby', { 'commit': '074200f', 'for': 'ruby' }
Plug 'vim-scripts/IndexedSearch', '500a64a'
Plug 'w0rp/ale', '0d8be55'
Plug 'xolox/vim-misc', '1.17.6'
Plug 'xolox/vim-notes', '0.33.4'
Plug 'Shougo/neosnippet.vim', 'ddd01d0'
Plug 'Shougo/neoyank.vim', 'ad56eca'

Plug 'rbong/vim-flog'

Plug 'junegunn/fzf', { 'tag': '0.16.8', 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-dadbod'

" Plug 'wikimatze/vim-radio'

if has('python3')
  " has to stick to that version because of python error (https://github.com/Shougo/deoplete.nvim/issues/654)
  Plug 'Shougo/deoplete.nvim', { 'commit': '76b4ed40605fed1cef38e289ff21b0e2c66d6e05', 'do': ':UpdateRemotePlugins' }
  Plug 'fishbullet/deoplete-ruby', '7f6fb3a' " ruby completion
  Plug 'Shougo/neco-vim', '2329ad0'          " vimscript completion
  Plug 'Shougo/denite.nvim', '56a9f17'
endif

Plug 'wellle/tmux-complete.vim', 'e74076d' " tmux completion

call plug#end()

let g:flog_default_date_format = 'format:%Y-%m-%d %H:%M:%S'
let g:flog_default_format = "[%h] %ad %d %c %a %s"


" General settings {{{

set number                                  " display line numbers
set noerrorbells                            " turn of nasty error sounds
set autoindent                              " Copy indent from current line when starting a new line
set autoread                                " automatically read a file that has changed on disk
set autowrite                               " automatically write a file when moving to another buffer
let &showbreak='↳ '                             " show the symbol for wrapped lines
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
set guicursor=                              " prevent strange symbols (see https://github.com/neovim/neovim/issues/7002)
set breakindent                             " every wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks



" Prefer Neovim terminal insert mode to normal mode.
augroup terminal
  autocmd BufEnter term://* startinsert
augroup END


set inccommand=split " open a split where you can see the substitutions interactive

" external tool when using grep
if executable('pt')
  set grepprg=pt
elseif executable('ag')
  set grepprg=ag
endif

" Remove Vim' automatic comment prefixing (http://tilvim.com/2013/12/30/remove-comment-prefix-2.html)
augroup comment_prefixing
  autocmd FileType * setlocal formatoptions-=r formatoptions-=o
augroup END

let g:mapleader = ',' " change the leader to be a comma vs. backslash if not given

let &scrolloff=999-&scrolloff " current view is always centered


let g:file = expand('%')
if g:file =~# 'padrinocasts.md'
    colorscheme delek
else
    colorscheme github
endif

set tags=tags,./tags,gems.tags,./gems.tags

" }}}
" Persisten undo {{{
if has('persistent_undo')
  if !isdirectory($HOME . '/.undodir/')
    call mkdir($HOME . '/.undodir/')
  endif
  set undodir=$HOME/.undodir/
  set undofile
endif

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

if has('wildmenu')
  set wildmenu                           " enable a navigable list of suggestions
  set wildmode=full                      " zsh full-match, starts over with first match after last match reached
  set wildignore+=.git,.hg,.svn                 " version control
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png " images
  set wildignore+=*.aux,*.out,*.toc             " LaTeX intermediate files
  set wildignore+=.DS_Store                     " Mac
  set wildignore+=*~,*.swp,*.tmp                " tmp and backup files
endif

" }}}
" Functions {{{
" Trailing whitespace removal {{{

fu! <SID>StripTrailingWhitespaces()
  " preparation: save last search, and cursor position.
  let l:_s=@/
  let l:l = line('.')
  let l:c = col('.')
  " do the business:
  silent! execute ':%s/\s\+$//'
  " Clean up: restore previous search history, and cursor position
  let @/=l:_s
  call cursor(l:l, l:c)
endf

" when file is saved, call the function to remove trailing whitespace
augroup whitespace_striping
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup END

" }}}
" Insert date in the form yyyy-mm-dd at the end of a line, <F5> {{{
fu! InsertSpaceDate()
  let @x = ' '
  let @x = @x . strftime('%Y-%m-%d')
  normal! "xp
  silent exec line('.') . 's/TODO/DONE'
endf

no <silent> <F5> $:call InsertSpaceDate() <CR>
ru functions/insert_spacedate.vim
" }}}
" Close all buffers except the current one :Bdeleteonly {{{
" Found solution under
" http://vim.1045645.n5.nabble.com/Close-all-buffers-except-the-one-you-re-in-td1183357.html
function! Buflist()
    redir => l:bufnames
    silent ls
    redir END
    let l:list = []
    for l:i in split(l:bufnames, "\n")
        let l:buf = split(l:i, '"' )
        call add(l:list, l:buf[-2])
    endfor
    return l:list
endfunction

function! Bdeleteonly()
    let l:list = filter(Buflist(), 'v:val != bufname('%')')
    for l:buffer in l:list
        exec 'bdelete ' . l:buffer
    endfor
endfunction

command! BdelOnly :silent call Bdeleteonly()
" }}}
" }}}
" Plugin settings {{{

ru! plugin_settings/*.vim

" }}}
" Settings {{{

ru settings/auto_line_return.vim " always return to the last cursors position for a file
ru settings/filetype_setters.vim " set filetypes to certain files

" }}}
" Mappings {{{

ru mappings/commandline.vim               " <C-b> go char left, <C-f> go char right, <C-p> go previews command, <C-n> go next command
ru mappings/copy_paste_clipboard.vim      " <C-c> for copy, <leader-C-v> to paste from clipboard in normal mode
ru mappings/esc_with_jk.vim               " emulate ESC with jk
ru mappings/far.vim                       " q will close the Far window
ru mappings/fzf.vim                       " <C-p> start file search, ; will start buffer search
ru mappings/flog.vim                      " q will close flog related windows
ru mappings/grepper.vim                   " <C-n|C-p> will browser grep history, gs as a motion (e.g. gsW, or mark a text in visual and press gs)
" ru mappings/help.vim                      " q will close help window
ru mappings/keep_cursor_joining_lines.vim " indent joining lines the right way
ru mappings/moving_wrapped_lines.vim      " Use hjkl in wrapped-lined files
ru mappings/neoyank.vim                   " <leader>y search the yank history
ru mappings/notes.vim                     " F7 will open notes with the collect file
ru mappings/pry.vim                       " ,pi toggles 'binding pry'
ru mappings/quickediting.vim              " ,ba; ,bm; ,br; ,ev to edit files of vim repos
"ru mappings/quickfix_window.vim           " q will close the quickfix window
ru mappings/ranger.vim                    " F2 will call :Ranger
ru mappings/tagbar.vim                    " F3 will call :TagbarToggle
ru mappings/terminal.vim                  " :T, :VT will open a split/vsplit with terminal, ESC ... exit terminal mode, <C-h|j|k|l> to move windows
ru mappings/vim_test.vim                  " <leader>t :TestNearest, <leader>T :TestFile, <leader>a :TestSuite, <leader>l :TestLastVisit, <leader>g :TestVisit


" ,d to copy the file path to clipboard, very handy for file name completion for vimbook
nmap <leader>d :call system("xclip -i -selection clipboard", expand("%"))<CR>

" Spellchecker: press ,s to toogle between spellchecker
nn <silent> <leader>s :set spell!<CR>

" Folding Toggling with <space>
nn <space> za

" }}}
" Settings for autocompletion in insert mode <C-n> {{{

" set autocompletion when CTRL-P or CTRL-N are used.
" It is also used for whole-line
" . ... current buffer
" i ... current and included files
" b ... other loaded buffers that are in the buffer list
" w ... buffers from other windows
" u ... scan unloaded buffers that are in the buffer list
" U ... scan buffers that are not in the buffer list
" t ... tag completion
set complete=.,i,b,w,u,U,t
set showfulltag " when completing by tag, show the whole tag, not just the function name

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inspiration from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc#L280
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction

function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_controller = match(expand("%"), 'controllers/') != -1
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app && in_controller
      let new_file = substitute(new_file, '^app/', '', '')
    end

    if in_controller
      let new_file = substitute(new_file, '\.e\?rb$', '_controller_spec.rb', '')
      let new_file = 'spec/app/' . new_file
    else
      let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
      let new_file = 'spec/' . new_file
    end
  else
    if in_controller
      let new_file = substitute(new_file, '_controller_spec\.rb$', '.rb', '')
      let new_file = substitute(new_file, '^spec/', '', '')
    endif
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

" CopyMatch {{{
" Details under https://vim.fandom.com/wiki/Copy_search_matches

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

"}}}
