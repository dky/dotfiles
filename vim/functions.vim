" Disable line numbers, Git Gutter, Indent Guides
function! NumberToggle()
	if(&number == 1 && &list == 1)
		set nonumber
		set nolist
		set signcolumn=no
		"GitGutterDisable
		Gitsigns toggle_signs
		IndentBlanklineDisable
		"setlocal conceallevel=0
		"set concealcursor=
	else
		set number
		set list
		set signcolumn=yes
		"GitGutterEnable
		Gitsigns toggle_signs
		IndentBlanklineEnable
	endif
endfunc

" close all buffers
function! CloseAllBuffersButCurrent()
	let curr = bufnr("%")
	let last = bufnr("$")

	if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
	if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction

" This func is necessary to remove the additional whitespace added after
function! Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

" Check to ensure we aren't in a nerdtree file browser when running command
"function! IsNerdTreeOpen(command_str)
	"if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
		"exe "normal! \<c-w>\<c-w>"
	"endif
	"exe 'normal! ' . a:command_str . "\<cr>"
"endfunction

" function to create directory and cd into it.
function! CreateDailyFolder()
	let tstamp = strftime("%m-%d-%y")
	let folderpath = $PWD."/".tstamp
	let cmd = 'cd ' . folderpath
	if !isdirectory(folderpath)
		echo 'Dir does not exist, creating:' folderpath
		call mkdir(folderpath, 'p')
		echo 'Switching working dir to:' folderpath
	else
		echo 'Switching working dir to:' folderpath
		execute cmd
	endif
endfunction

" Call this func if we are dealing with markdown files
function! WordProcessorMode()
  " Insert mode auto completion case-insensitivity
  set ignorecase
  set infercase
  " Map to custom abbreviations + dictionary
  if !empty(glob("~/.vim-dictionary/abbreviations.vim"))
    source ~/.vim-dictionary/abbreviations.vim
  endif
  "This loads a lot of words we don't really need. Rather use our custom
  "dictionary for better completion.
  set dictionary+=~/.vim/dict/20k.txt
  set dictionary+=~/.vim-dictionary/custom_dictionary.txt
  setlocal spell spelllang=en_us

  augroup auto_capitalize_sentences
    au!
    au InsertCharPre <buffer> if search('\v(%^|%^[1-7]{2}\s|[.!?]\_s+|\_^\s*\-\s|\_^#+\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
  augroup END
endfu

" This function allows us to replace all the F3 mappings and potentially use
" whichkey to call a function with a file type
function! EditLangFile(prog_file)
	"'edit ~/tmp/py_' . strftime("%m%d%y_%H%M%S") . '.py'<cr>
	let file_type = a:prog_file
	let file_path = "~/tmp/" . file_type
	let file_date = strftime("%m%d%y_%H%M%S")
	let edit_file = file_path . "_" . file_date . "." . file_type
	"echom edit_file
	execute "e ".edit_file
endfunction

" Function to copy current buffer into a new file without manually writing and
" re-opening
function! CopyCurrentFile()
	let old_name = expand('%')
	let new_name = input('Copy to file name: ',)
	if new_name != '' && new_name != old_name
		exec ':saveas ' . new_name
		redraw!
	endif
endfunction

" This should be broken out into .vim_plugins and .vim_autocommands but don't know why it fails currently.
" space code appropriately for file type.
autocmd BufNewFile,BufRead * call s:DetectNode()

" If a file is detected as bash set it to sh
function! s:DetectNode()
	if getline(1) == '#!/bin/bash'
		set ft=sh
	endif
endfun
