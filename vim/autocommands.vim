" restore last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

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

" snippets
" https://github.com/Shougo/neosnippet.vim/issues/445
au BufNewFile,BufRead *.snip set noet|%retab!

" yaml
au BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml

" .gohtml files should be html
au BufReadPost *.gohtml set syntax=html

" When opening markdown files call WordProcessorMode
au BufNewFile,BufRead *.md call WordProcessorMode()

" When opening Jenkinsfiles set syntax to groovy
au BufNewFile,BufRead Jenkinsfile setf groovy

" When opening nomad files set syntax to groovy
au BufNewFile,BufRead *.nomad setf hcl

" When opening .markdownlintrc treat it as json
au BufNewFile,BufRead .markdownlintrc setf json
