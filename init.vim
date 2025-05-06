set ignorecase
set textwidth=72
set shell=bash

" setting indent
filetype plugin indent on
set expandtab
set tabstop=4
set autoindent
set smartindent
set shiftwidth=4
set cindent

" auto close bracket
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap {<CR> {<CR>}<Esc>O

" set backup
set number
set history=50
set nolangremap
map Q gq
filetype plugin indent on

" vnoremap _g y:exe "grep /" .. escape(@", '\\/') .. "/ **/*.c"<CR>

augroup RestoreCursor
	autocmd!
	autocmd BufReadPre * autocmd FileType <buffer> ++once
				\ let s:line = line("'\"")
				\ | if s:line >= 1 && s:line <= line("$") && &filetype !~# 'commit'
				\      && index(['xxd', 'gitrebase'], &filetype) == -1
				\      && !&diff
				\ |  execute "normal! g`\""
				\ | endif
augroup END

command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
			\ | wincmd p | diffthis
