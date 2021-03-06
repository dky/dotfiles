"Golang
au FileType go nmap <F8> :echo system('go run "' . expand('%') . '"')<cr>
au FileType go imap <F8> <Esc> :w <cr> :echo system('go run "' . expand('%') . '"')<cr>
"Python
au FileType python nmap <F8> :echo system('python3 "' . expand('%') . '"')<cr>
au FileType python imap <F8> <Esc> :w <cr> :echo system('python3 "' . expand('%') . '"')<cr>
"JS
au FileType javascript nmap <F8> :echo system('node "' . expand('%') . '"')<cr>
au FileType javascript imap <F8> <Esc> :w <cr> :echo system('node "' . expand('%') . '"')<cr>
"Coffeescript
au FileType coffee nmap <F8> :echo system('coffee "' . expand('%') . '"')<cr>
au FileType coffee imap <F8> <Esc> :w <cr> :echo system('coffee "' . expand('%') . '"')<cr>
"Shell
au FileType sh nmap <F8> :echo system('bash "' . expand('%') . '"')<cr>
au FileType c nmap <F8> :w <cr> :!gcc % -o %< && ./%< <cr>
"C
au FileType c imap <F8> <Esc> :w <cr> :!gcc % -o %< && ./%< <cr>
"Json
au FileType json nmap <F8> :w <cr> :echo system('python -m json.tool "' . expand('%') . '"')<cr>
au FileType json imap <F8> <Esc> :w <cr> :echo system('python -m json.tool "' . expand('%') . '"')<cr>

" shorter aliases for vim-go plugin
au FileType go nmap <leader><F12> :GoDecls<cr>
au FileType go nmap <F12> <Plug>(go-def)

"quotes
autocmd FileType python,go inoremap " ""<left>
autocmd FileType python,go inoremap ' ''<left>

autocmd FileType python call SemshiCustomHighlights()

" remap leader to space local leader to , since your middle is probably
" stronger than your pinky.
let mapleader = "\<Space>"
let maplocalleader = ','

" remap esc to jk
imap jk <Esc>

" no l/r arrow keys
nmap <left> <nop>
nmap <right> <nop>

" map F1 vim help to esc, kept bringing up the help menu in insert mode
imap <F1> <Esc>
nmap <F1> :RnvimrToggle<cr>

nnoremap <silent> <F4> :call NumberToggle()<cr>

" Comment out blocks of code using nerdcommenter
nmap <F7> <leader>c<space>
vmap <F7> <leader>c<space>

" fugitive
nnoremap <F9> :execute ":!git push origin HEAD"<cr>
nnoremap <F10> :!git add . && git commit -a -m "
imap <F10> <Esc> :!git add . && git commit -a -m "

" edit .vimrc quickly
nmap ,ev :tabedit $HOME/.dotfiles/.vimrc<cr>
nmap ,ch :CheckHealth<cr>
nmap ,up :UpdateRemotePlugins<cr>
" shortcut for vundle
nmap ,bi :PlugInstall<cr>
" reload snippets
nnoremap ,rs :call neosnippet#variables#set_snippets({})<cr>

" https://stackoverflow.com/questions/11037825/vim-get-out-of-parenthesis-brackets-etc
inoremap <C-e> <C-o>A
inoremap <C-f> <C-o>l
inoremap <C-j> <C-o>o
inoremap <C-k> <C-o>O
"Open a line below in insert, backspace then add a blank line. Useful for def
"in Python, map this to Alt. A = Alt
inoremap <A-o> <C-o>o<BS><cr>

" Custom surrounds
" surround markdown emphasis
nnoremap ,s* ciw**<C-r>"**<Esc>
nnoremap ,s" ciw"<C-r>""<Esc>
nnoremap ,s` ciw`<C-r>"`<Esc>
nnoremap ,s[ ciw[<C-r>"]<Esc>
nnoremap ,s( ciw(<C-r>")<Esc>
nnoremap ,s{ ciw{<C-r>"}<Esc>
" Python docstring or markdown code block fencing
" 1. Select text with shift + v
" 2. Shift + S + " or / to fence
let b:surround_{char2nr('"')} = "\"\"\"\r\"\"\""
let b:surround_{char2nr('`')} = "\`\`\`\r\`\`\`"
let b:surround_{char2nr('b')} = "\`\`\`bash\r\`\`\`"
" Handle fencing in *.md files where the first letter is auto capitalized.
let b:surround_{char2nr('~')} = "\`\`\`\r\`\`\`"
let b:surround_{char2nr('B')} = "\`\`\`bash\r\`\`\`"

" neosnippets
imap <C-l> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)
nnoremap <leader>rs :call neosnippet#variables#set_snippets({})<cr>
" Pull up help docs for snippet syntax
nnoremap <leader>hs :help neosnippet-snippet-syntax<cr>

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<cr>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<cr>

" toggle auto formatting:
"nmap <Leader>C :ClangFormatAutoToggle<cr>
" vim-logbook
noremap ,lb :Lb<cr>
noremap ,ts :Ts<cr>

" Vim-Sneek
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" autoclose for only certain strings/braces
"inoremap [ []<left>
"inoremap { {}<left>

" Experiments with nvim terminal
if has('nvim')
	" map esc back to something sane in terminal mode.
	tnoremap <Esc> <C-\><C-n>
	" once you map esc you can't send esc key to the underlying program in the
	" buffer. Map Alt+[ to send esc to the underlying program.
	tnoremap <A-[> <Esc>
	" alt+[h,j,k,l] for quickly switching between splits with terminals.
	tnoremap <A-h> <c-\><c-n><c-w>h
	tnoremap <A-j> <c-\><c-n><c-w>j
	tnoremap <A-k> <c-\><c-n><c-w>k
	tnoremap <A-l> <c-\><c-n><c-w>l
endif

" navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
"nmap <c-h> 4h
"nmap <c-l> 4l
" Jump between left/right splits without as much pain
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Hop around splits faster, this break my faster ctrl+j,k,l,h movements
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-h> <C-W>h
map <A-l> <C-W>l

" Experimenting with tabs
" tp "tab previous in normal mode"
nmap tp :tabp<cr>
" tn "tab next in normal mode"
nmap tn :tabn<cr>
" control-t for new tab, control-w to close, similar to browser
"nmap <C-t> :tabnew<cr>
"nmap <C-w> :tabclose<cr>

" 'cd' towards the dir in which the current file is edited
" but only change the path for the current window
map <leader>cd :lcd %:h<cr>
" Open files located in the same dir in with the current file is edited
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <cr>

" Delete everything in the file and start over, good for scratch testing.
nnoremap <localleader>d :1,$d<cr>
inoremap <localleader>d <esc>:1,$d<cr>

" leader l to quickly switch buffers.
"nnoremap <leader>l :ls<cr>:b<space>
nnoremap <silent> <localleader>l :Buffers<CR>
nnoremap <silent> <localleader>m :FZFMru<CR>

" FZF key bindings
" GFiles searches all files in the git repo
nmap <localleader>F :GFiles<cr>
"Call our custom Find command we defined to use fzf search across all files in
"project, this is defined in .vim_plugins.vim
nmap <localleader>f :Find<cr>

nnoremap <silent> <Right> :bn<cr>
nnoremap <silent> <Left> :bp<cr>

" Quickly create Python scratch files.
nnoremap <F3> :execute 'edit ~/tmp/py_' . strftime("%m%d%y_%H%M%S") . '.py'<cr>
nnoremap <leader>it :IndentGuidesToggle<cr>

" Python help
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<cr>

" Python add trailing space when using #
autocmd BufRead,BufNewFile *.py inoremap # #<space>

" Leader q out of finding a file... Much easier than esc + :q!, this is also
" defined in whichkeys so we don't re-map that to something else.
autocmd! FileType fzf tnoremap <buffer> <leader>q <c-c>
