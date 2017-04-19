if has('unix')
  vn <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
elseif has('mac')
  vn <C-c> y:call system("pbcopy", getreg("\""))<CR>
endif

