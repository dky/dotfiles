" restore last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" neosnippets
" You can :set noet|%retab! in your .snip file to replace all spaces with hard tabs, that way the extra indentation is fixed!
" https://github.com/Shougo/neosnippet.vim/issues/445
au BufNewFile,BufRead *.snip
			\ set noet|%retab!

" golang
au BufNewFile,BufRead *.go
			\ set noexpandtab |
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4

" js, html, css
au BufNewFile,BufRead *.js,*.html,*.css
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2

" markdown
au BufNewFile,BufRead *.md
			\ set noautoindent |
			\ set nocindent |
			\ set nosmartindent |
			\ set indentexpr=

" yaml
au BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:> foldmethod=indent nofoldenable

" .gohtml files should be html
au BufReadPost *.gohtml set syntax=html

augroup remember_folds
	autocmd!
	" https://vi.stackexchange.com/questions/13864/bufwinleave-mkview-with-unnamed-file-error-32
	" autocmd BufWinLeave * mkview
	" autocmd BufWinEnter * silent! loadview
	" view files are about 500 bytes
	" bufleave but not bufwinleave captures closing 2nd tab
	" nested is needed by bufwrite* (if triggered via other autocmd)
	autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
	autocmd BufWinEnter ?* silent! loadview
augroup END

" create dir that does not exist on save
" https://vi.stackexchange.com/questions/678/how-do-i-save-a-file-in-a-directory-that-does-not-yet-exist
augroup createDirIfNoneExists
	autocmd!
	autocmd BufWritePre *
				\ if !isdirectory(expand("<afile>:p:h")) |
				\ call mkdir(expand("<afile>:p:h"), "p") |
				\ endif
augroup END

" When opening markdown files call WordProcessorMode
au BufNewFile,BufRead *.md call WordProcessorMode()

" change Color when entering Insert Mode
autocmd InsertEnter * hi CursorLine ctermbg=24
" revert Color to default when leaving Insert Mode
autocmd InsertLeave * hi CursorLine ctermbg=236
" autocmd InsertLeave * highlight  Cursor guibg=#A6E22E;" This
