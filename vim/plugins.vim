" vim-go
source ~/.dotfiles/vim/vim-go.vim
" Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Rainbow Parenthesis
let g:rainbow_active = 1

" Codi
"let g:codi#width = winwidth(winnr()) / 2
let g:codi#rightalign = 0

"Disable semshi error sign and just let flake8 handle it.
let g:semshi#error_sign = v:false

"let NERDTreeIgnore = ['\.pyc$', '\.go.mod$', '\.DS_Store$', '__pycache__', 'venv', '.git', '.vim']
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
"let NERDTreeShowHidden = 1
"let NERDTreeQuitOnOpen = 1
"let NERDTreeAutoDeleteBuffer = 1
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
"let NERDTreeAutoDeleteBuffer = 1

" refresh nerdtree
"set autoread
"au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

" neosnippets
let g:neosnippet#snippets_directory='~/.vim/snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
" Autosave broke snippet expansion
" https://github.com/Shougo/neosnippet.vim/issues/331
" :help g:neosnippet#enable_auto_clear_markers
let g:neosnippet#enable_auto_clear_markers = 0
" Get rid of preview popup
set completeopt-=preview

" clangformat C code
let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -4,
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AlwaysBreakTemplateDeclarations" : "true",
			\ "Standard" : "C++11"}

set omnifunc=syntaxcomplete#Complete

let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-i': 'split',
			\ 'ctrl-v': 'vsplit' }

" <leader>f opens rg fzf to search files.
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, {'options': '--no-preview'}, <bang>0)

" mac dictionary
let g:vim_mac_dictionary_use_app = 1

" Shell command formatter, call this when editing ugly shell one liners with ctr-g
command! -range Fmtsh <line1>!format_shell_cmd.py

" vim-indentguides
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indentguides_firstlevel = 1
let g:indentguides_conceal_color = 'ctermfg=238 ctermbg=234'

" terraform-vim plugin
"let g:terraform_fmt_on_save=1
let g:terraform_align=1

" plasticboy vim markdown disable folding
let g:vim_markdown_folding_disabled = 1

" floaterm
let g:floaterm_autoinsert=1
let g:floaterm_width=1.0
let g:floaterm_height=0.7
let g:floaterm_autoclose=0
let g:floaterm_position='bottom'
let g:floaterm_title='ft: $1/$2'

" vim sneak
let g:sneak#label = 1

" Ranger
"nnoremap <silent> <leader>r :RnvimrToggle<CR>.
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
" Disable a border for floating window
let g:rnvimr_draw_border = 0
" Hide the files included in gitignore
let g:rnvimr_hide_gitignore = 1

"vim-test
let test#python#runner = 'pytest'
let test#strategy = "floaterm"
