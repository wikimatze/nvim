let g:notes_directories = ['~/nextcloud/notes'] " path of main directory
let g:notes_shadowdir = '~/.config/nvim/note_shadow'   " path for templates creating new notes
let g:notes_suffix = '.txt'               " default file ending of note files
let g:notes_smart_quotes = 0              " Don't use special symbols


" Disable original folding of xolox#notes#foldexpr() because it's slow for big files
function! NotesFastFold(lnum)
  let line = getline(a:lnum)
  if line =~ '^#'
    return '>' . matchend(line, '^#\+')
  endif
  return '='
endfunction

function! EnableNotesFastFolding()
  if line2byte(line('$')) > 100000
    setlocal foldmethod=expr foldexpr=NotesFastFold(v:lnum)
  endif
endfunction
autocmd FileType notes call EnableNotesFastFolding()
