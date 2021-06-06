" enter insert mode after opening a floaterm
let g:floaterm_autoinsert=1
let g:floaterm_width=1.0
let g:floaterm_height=0.8
let g:floaterm_autoclose=0
let g:floaterm_position='bottom'
"let g:floaterm_title='ft: $1/$2'
" when opening files inside of a float open in new buffer
let g:floaterm_opener='edit'

" Floaterm
cabbrev fts FloatermSend
cabbrev ftn FloatermNext
cabbrev ftp FloatermPrev


function! FtGo()
	execute 'FloatermNew --name=go --title=go --width=1.0 --height=0.5 --position=bottom'
	" don't focus to the repl terminal, keep cursor on the editor
	execute 'wincmd p'
endfunction
