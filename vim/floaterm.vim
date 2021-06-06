" enter insert mode after opening a floaterm
let g:floaterm_autoinsert=1
let g:floaterm_autoclose=0
" when opening files inside of a float open in new buffer
let g:floaterm_opener='edit'

" Floaterm
cabbrev fts FloatermSend
cabbrev ftn FloatermNext
cabbrev ftp FloatermPrev
cabbrev ftl Floaterms

function! FtGo()
	execute 'FloatermNew --name=go --title=go --width=1.0 --height=0.8 --position=bottom --silent'
	" don't focus to the repl terminal, keep cursor on the editor
	execute 'wincmd p'
endfunction

function! FtTf()
	execute 'FloatermNew --name=tf --title=tf --width=1.0 --height=0.8 --position=bottom --silent'
	" don't focus to the repl terminal, keep cursor on the editor
	execute 'wincmd p'
endfunction
