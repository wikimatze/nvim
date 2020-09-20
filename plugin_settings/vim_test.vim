let test#ruby#bundle_exec = 1
let test#ruby#minitest#executable = 'ruby -Itest'

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

