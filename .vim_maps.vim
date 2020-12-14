au FileType go nmap <F8> :w <cr> :echo system('go run "' . expand('%') . '"')<cr>
au FileType go imap <F8> <Esc> :w <cr> :echo system('go run "' . expand('%') . '"')<cr>
au FileType python nmap <F8> :echo system('python3 "' . expand('%') . '"')<cr>
au FileType python imap <F8> <Esc> :w <cr> :echo system('python3 "' . expand('%') . '"')<cr>
au FileType javascript nmap <F8> :echo system('node "' . expand('%') . '"')<cr>
au FileType javascript imap <F8> <Esc> :w <cr> :echo system('node "' . expand('%') . '"')<cr>
au FileType coffee nmap <F8> :echo system('coffee "' . expand('%') . '"')<cr>
au FileType coffee imap <F8> <Esc> :w <cr> :echo system('coffee "' . expand('%') . '"')<cr>
au FileType sh nmap <F8> :echo system('bash "' . expand('%') . '"')<cr>
au FileType c nmap <F8> :w <cr> :!gcc % -o %< && ./%< <cr>
au FileType c imap <F8> <Esc> :w <cr> :!gcc % -o %< && ./%< <cr>

au FileType json nmap <F8> :w <cr> :echo system('python -m json.tool "' . expand('%') . '"')<cr>
au FileType json imap <F8> <Esc> :w <cr> :echo system('python -m json.tool "' . expand('%') . '"')<cr>

" shorter aliases for vim-go plugin
au FileType go nmap <leader><F12> :GoDecls<cr>
au FileType go nmap <F12> <Plug>(go-def)

" tmux-send keys to send commands to other panes.
au FileType go nmap <F5> :execute ":!tmux send-keys -t 3 C-c 'go run *.go' C-m"<cr><cr>
au FileType go imap <F5> <Esc> :w <cr> :execute ":!tmux send-keys -t 3 C-c 'go run *.go' C-m"<cr><cr>
nnoremap <silent> ,rg :execute ":!tmux send-keys -t 3 C-c 'go run *.go' C-m"<cr><cr>
au FileType go nmap <F5><F5> :execute ":!tmux send-keys -t 3 'go run *.go' C-m"<cr><cr>
au FileType go imap <F5><F5> <Esc> :w <cr> :execute ":!tmux send-keys -t 3 'go run *.go' C-m"<cr><cr>
nnoremap <silent> ,gr :execute ":!tmux send-keys -t 3 'go run *.go' C-m"<cr><cr>
nnoremap <silent> ,c :execute ":!tmux send-keys -t 3 C-c"<cr><cr>
nnoremap <silent> ,cl :execute ":!tmux send-keys -t 3 clear"<cr><cr>
au FileType python nmap <F5> :execute ":!tmux send-keys -t bottom 'python3 *.py' C-m"<cr><cr>
au FileType python imap <F5> <Esc> :w <cr> :execute ":!tmux send-keys -t bottom 'python3 *.py' C-m"<cr><cr>

au FileType terraform nmap <F5> :execute ":!tmux send-keys -t bottom 'terraform apply -auto-approve' C-m"<cr><cr>
au FileType terraform imap <F5> <Esc> :w <cr> :execute ":!tmux send-keys -t bottom 'terraform apply -auto-approve' C-m"<cr><cr>

au FileType terraform nmap <F6> :execute ":!tmux send-keys -t bottom 'terraform destroy -auto-approve' C-m"<cr><cr>
au FileType terraform imap <F6> <Esc> :w <cr> :execute ":!tmux send-keys -t bottom 'terraform destroy -auto-approve' C-m"<cr><cr>

autocmd FileType python,go inoremap " ""<left>
autocmd FileType python,go inoremap ' ''<left>
autocmd FileType python call SemshiCustomHighlights()

" remap esc to jk
imap jk <Esc>

" no l/r arrow keys
nmap <left> <nop>
nmap <right> <nop>

" map F1 vim help to esc, kept bringing up the help menu in insert mode
imap <F1> <Esc>
nmap <F1> :NERDTreeToggle<cr>

nnoremap <F4> :call NumberToggle()<cr>

" Comment out blocks of code using nerdcommenter
nmap <F7> <leader>c<space>
vmap <F7> <leader>c<space>

" fugitive
nnoremap <F9> :execute ":!git push origin HEAD"<cr>
nnoremap <F10> :!git add . && git commit -a -m "
imap <F10> <Esc> :!git add . && git commit -a -m "

" Nerdtree bookmark
nmap ,nb :Bookmark

" edit .vimrc quickly
nmap ,ev :tabedit $HOME/.dotfiles/.vimrc<cr>
nmap ,ch :CheckHealth<cr>
nmap ,up :UpdateRemotePlugins<cr>
" shortcut for vundle
nmap ,bi :PlugInstall<cr>
nmap ,gib :GoInstallBinaries<cr>

" map space rather than colon
nmap <space> :

" navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l

nnoremap <silent> <leader>gs :call IsNerdTreeOpen(':Git status')<cr>
nnoremap <silent> <leader>gd :call IsNerdTreeOpen(':Git diff')<cr>

" https://stackoverflow.com/questions/11037825/vim-get-out-of-parenthesis-brackets-etc
inoremap <C-e> <C-o>A
inoremap <C-f> <C-o>l
inoremap <C-j> <C-o>o
inoremap <C-k> <C-o>O

" Custom surrounds
" surround markdown emphasis
nnoremap ,s* ciw**<C-r>"**<Esc>
nnoremap ,s" ciw"<C-r>""<Esc>
nnoremap ,s` ciw`<C-r>"`<Esc>
nnoremap ,s[ ciw[<C-r>"]<Esc>
nnoremap ,s( ciw(<C-r>")<Esc>
nnoremap ,s{ ciw{<C-r>"}<Esc>

" Python docstring
let b:surround_{char2nr('c')} = "\"\"\"\r\"\"\""

" Vim airline tab switching
nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5

" reload snippets
nnoremap ,rs :call neosnippet#variables#set_snippets({})<cr>
imap <C-l> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)
nnoremap <leader>rs :call neosnippet#variables#set_snippets({})<cr>
" Pull up help docs for snippet syntax
nnoremap <leader>hs :help neosnippet-snippet-syntax<cr>

" Toggle ale on and off. At was for ale toggle...
"au FileType python nmap <silent> <F3> :ALEFix<cr>
map <leader>at :ALEToggle<CR>
map <leader>af :ALEFix<CR>

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<cr>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<cr>

" toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<cr>

nnoremap <silent> ,dkps :execute ":!tmux send-keys -t 2 'docker ps' C-m"<cr><cr>
nnoremap <silent> ,mpl :execute ":!tmux send-keys -t 2 'make post-linux' C-m"<cr><cr>
nnoremap <silent> ,mpr :execute ":!tmux send-keys -t 2 'make post-registrator' C-m"<cr><cr>
nnoremap <silent> ,cl :execute ":!tmux send-keys -t 2 'clear' C-m"<cr><cr>
nnoremap <silent> ,pa :execute ":!tmux send-keys -t 2 './apply.sh' C-m"<cr><cr>

" FZF key bindings
nmap <Leader>F :GFiles<cr>
"nmap <Leader>f :Files<cr>
"Call our custom Find command we defined to use fzf search across all files in
"project, this is defined in .vim_plugins.vim
nmap <Leader>f :Find<cr>
"Search current buffer
nmap <Leader>b :BLines<CR>
"Search across all loaded buffers
nmap <Leader>B :Lines<CR>
nmap <Leader>h :History<cr>
nmap <Leader>t :BTags<cr>

" ctrl+f brings up fzf
" ctrl-t on a file brings up in new tab
" ctrl-i on a file splits horizontally.
" ctrl-v on a file splits vertically.
"nnoremap <C-f> :FZF<cr>

" vim-logbook
noremap ,lb :Lb<cr>
noremap ,ts :Ts<cr>

" Vim-Sneek
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" autoclose for only certain strings/braces
inoremap [ []<left>
inoremap { {}<left>

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

" leader l to quickly switch buffers.
nnoremap <leader>l :ls<cr>:b<space>

" Experimenting with tabs
" tp "tab previous in normal mode"
nmap tp :tabp<cr>
" tn "tab next in normal mode"
nmap tn :tabn<cr>
" control-t for new tab, control-w to close, similar to browser
"nmap <C-t> :tabnew<cr>
"nmap <C-w> :tabclose<cr>

" Hop around splits faster, this break my faster ctrl+j,k,l,h movements
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-h> <C-W>h
map <A-l> <C-W>l

" 'cd' towards the dir in which the current file is edited
" but only change the path for the current window
map <leader>cd :lcd %:h<cr>
" Open files located in the same dir in with the current file is edited
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <cr>

" run the current file with rspec
let g:VimuxPromptString = "run: "
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<cr>
map <Leader>vp :VimuxPromptCommand<cr>
map <Leader>vl :VimuxRunLastCommand<cr>
map <Leader>vi :VimuxInspectRunner<cr>
map <Leader>vq :VimuxCloseRunner<cr>
map <Leader>vx :VimuxInterruptRunner<cr>
map <Leader>vz :call VimuxZoomRunner()<cr>

" Delete everything in the file and start over, good for scratch testing.
nnoremap <leader>d :1,$d<cr>
inoremap <leader>d <esc>:1,$d<cr>

nnoremap <silent> <Right> :bn<cr>
nnoremap <silent> <Left> :bp<cr>

" Quickly create Python scratch files.
nnoremap <F3> :execute 'edit ~/tmp/py_' . strftime("%m%d%y_%H%M%S") . '.py'<cr>
nnoremap <leader>it :IndentGuidesToggle<cr>

"Open a line below in insert, backspace then add a blank line. Useful for def
"in Python, map this to Alt. A = Alt
inoremap <A-o> <C-o>o<BS><cr>

" Python help
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<cr>

" Python add trailing space when using #
autocmd BufRead,BufNewFile *.py inoremap # #<space>

nnoremap mkd :call CreateDailyFolder()<cr>

" macdictionary support
nnoremap <C-d> :MacDictWord<cr>

" Quickly copy a file in the buffer
nnoremap <leader>c :call CopyCurrentFile()<cr>

" Floatterm
nnoremap <silent> <leader>ft :FloatermToggle<cr>
