" Project specific settings

" Indentation style rules
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Give a visual gutter at column 110
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" Let vim know that we are only dealing with C and not C++
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" For use with gf, file path
" let &path.="/user/include,"

