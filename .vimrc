" Setting up vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" BundleInstall
" ,bi

set ruler				" ruler bottom right
set nocompatible		" be iMproved
set hidden 				" no prompt for unsaved buffers
filetype off			" required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rodjek/vim-puppet'
Bundle 'bling/vim-airline'
Bundle 'mattn/emmet-vim'
Bundle 'godlygeek/tabular'
Bundle 'msanders/snipmate.vim'

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
 
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif

"solarized
let g:solarized_termtrans = 1
set background=light
colorscheme solarized

"syntax highlighting
filetype on

"line numering
set number

"when you hit tab go three spaces.
set tabstop=3
set shiftwidth=3

"autocompletion
set wildmode=list:longest
set smartindent
set autoindent

"split below
set splitbelow
set hlsearch
set foldenable

"source the .vimrc file after saving
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

"edit .vimrc quickly
nmap ,ev :tabedit $MYVIMRC<cr>

"turn off arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"turn off h,j,k,l
"noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
"noremap l <NOP>

"renamp esc to jk
imap jk <Esc>

"enable paste mode for pasted code
set pastetoggle=<F2>

"map space rather than colon
nmap <space> :

"Shave off shift
nnoremap ; :

"Shortcut for NERDTreeToggle
nmap ,nt :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

"Shortcut for vundle
nmap ,bi :BundleInstall<cr>

"Run ruby code
nmap ,r :!ruby %<cr>

"map F5 to toggle numbers 
map <F5> :set number!<CR>><ESC>
map <F4> :NERDTreeToggle<cr>

"tabs 
nmap ,t <Esc>:tabn<CR>
nmap ,tp <Esc>:tabp<CR>
nmap ,tn <Esc>:tab new<CR>

"vim fugitive git mappings 
nmap ,gs <Esc>:Gstatus<CR>
nmap ,gl <Esc>:Git log --pretty --pretty=oneline<CR>
nmap ,gco <Esc>:Git checkout<CR>
nmap ,gp <Esc>:Git push origin master<CR>
nmap ,ga <Esc>:Git add .<CR>

"Configure airline.
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

"run shell commands and go code

function! s:ExecuteInShell(command, bang)
    let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))

    if (_ != '')
        let s:_ = _
        let bufnr = bufnr('%')
        let winnr = bufwinnr('^' . _ . '$')
        silent! execute  winnr < 0 ? 'belowright new ' . fnameescape(_) : winnr . 'wincmd w'
        setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile wrap number
        silent! :%d
        let message = 'Execute ' . _ . '...'
        call append(0, message)
        echo message
        silent! 2d | resize 1 | redraw
        silent! execute 'silent! %!'. _
        silent! execute 'resize ' . line('$')
        silent! execute 'syntax on'
        silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
        silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
        silent! execute 'nnoremap <silent> <buffer> <CR> :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'
        nnoremap <silent> <buffer> <C-W>_ :execute 'resize ' . line('$')<CR>
        silent! syntax on
    endif
endfunction

command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')
cabbrev shell Shell

command! -complete=shellcmd -nargs=* -bang Gor call s:ExecuteInShell('go run %', '<bang>')
command! -complete=shellcmd -nargs=* -bang Gon call s:ExecuteInShell('go install', '<bang>')
command! -complete=shellcmd -nargs=* -bang Gob call s:ExecuteInShell('go build', '<bang>')
command! -complete=shellcmd -nargs=* -bang Got call s:ExecuteInShell('go test -v', '<bang>')

:map <F5>  :Gor<CR>
:map <F6>  :Gob<CR>
:map <F7>  :Gon<CR>
:map <F9>  :Got<CR>
:map <F10> :Fmt<CR>:w<CR>
:map <F12> :q<CR>

:map <leader>r :!perl %<cr>
