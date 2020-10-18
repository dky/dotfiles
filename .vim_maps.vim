" codi
nnoremap <silent> ,cd :execute ":Codi"<cr>
" remap esc to jk
imap jk <Esc>

" comment out blocks of code using nerdcommenter shortcut
nmap <F7> <leader>c<space>
vmap <F7> <leader>c<space>

" no l/r arrow keys
nmap <left> <nop>
nmap <right> <nop>

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
nnoremap <F4> :call NumberToggle()<cr>

" tagbar toggle
nmap ,tb :TagbarToggle<cr>

" map f1 vim help to esc, kept bringing up the help menu in insert mode
imap <F1> <Esc>
nmap ,nt :NERDTreeToggle<cr>
nmap <F1> :NERDTreeToggle<cr>
" Nerdtree bookmark
nmap ,nb :Bookmark

" edit .vimrc quickly
nmap ,ev :tabedit $HOME/.dotfiles/.vimrc<cr>
nmap ,ch :CheckHealth<cr>
nmap ,up :UpdateRemotePlugins<cr>
" shortcut for vundle
nmap ,bi :PlugInstall<cr>
nmap ,gib :GoInstallBinaries<cr>

"nnoremap <leader>r :source $MYVIMRC<cr>

" map space rather than colon
nmap <space> :

" navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l

nnoremap <silent> <leader>gs :call IsNerdTreeOpen(':Git status')<cr>
nnoremap <silent> <leader>gd :call IsNerdTreeOpen(':Git diff')<cr>

" fugitive
nnoremap <F9> :execute ":!git push origin HEAD"<cr>
nnoremap <F10> :!git add . && git commit -a -m "
imap <F10> <Esc> :!git add . && git commit -a -m "


" https://stackoverflow.com/questions/11037825/vim-get-out-of-parenthesis-brackets-etc
inoremap <C-e> <C-o>A
inoremap <C-f> <C-o>l
inoremap <C-j> <C-o>o
inoremap <C-k> <C-o>O
"Open a line below in insert, backspace then add a blank line. Useful for def
"in Python, map this to Alt. A = Alt
inoremap <A-o> <C-o>o<BS><cr>

" surround markdown emphasis
nnoremap ,s* ciw**<C-r>"**<Esc>
nnoremap ,s" ciw"<C-r>""<Esc>
nnoremap ,s` ciw`<C-r>"`<Esc>
nnoremap ,s[ ciw[<C-r>"]<Esc>
nnoremap ,s( ciw(<C-r>")<Esc>
nnoremap ,s{ ciw{<C-r>"}<Esc>
" shorter aliases for vim-go plugin
au FileType go nmap <leader><F12> :GoDecls<cr>
au FileType go nmap <F12> <Plug>(go-def)
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

" Python help
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<cr>

" Python add trailing space when using #
autocmd BufRead,BufNewFile *.py inoremap # #<space>
