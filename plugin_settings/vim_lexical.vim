command -nargs=0 English call lexical#init({
  \ 'spell': 1,
  \ 'spelllang':  ['en'],
  \ 'dictionary': ['/usr/share/dict/words'],
  \ 'thesaurus':  ['~/.config/nvim/thesaurus/mthesaur.txt'],
  \ 'spellfile':  ['~/.config/nvim/spell/en.utf-8.add']
  \ })

command -nargs=0 German call lexical#init({
  \ 'spell': 1,
  \ 'spelllang':  ['de_20'],
  \ 'dictionary': ['~/.vim/spell/gerspchk.dict'],
  \ 'thesaurus':  ['~/.config/nvim/thesaurus/openthesaurus.txt'],
  \ 'spellfile':  ['~/.config/nvim/spell/de.utf-8.add']
  \ })

let g:lexical#thesaurus_key = '<C-x>k'

