set ignorecase
set backup
set history=50
set nolangremap
vnoremap _g y:exe "grep /" .. escape(@", '\\/') .. "/ *.c *.h"<CR>
filetype plugin indent on

augroup RestoreCursor
	autocmd!
	autocmd BufReadPre * autocmd FileType <buffer> ++once
				\ let s:line = line("'\"")
				\ | if s:line >= 1 && s:line <= line("$") && &filetype !~# 'commit'
				\      && index(['xxd', 'gitrebase'], &filetype) == -1
				\ |   execute "normal! g`\""
				\ | endif
autogroup End

command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
	  \ | wincmd p | diffthis


