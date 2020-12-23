" Rainbow Parenthesis
let g:rainbow_active = 1

" Codi
let g:codi#width = winwidth(winnr()) / 2
let g:codi#rightalign = 0

"Disable semshi error sign and just let flake8 handle it.
let g:semshi#error_sign = v:false

let NERDTreeIgnore = ['\.pyc$', '\.go.mod$', '\.DS_Store$', '__pycache__', 'venv', '.git', '.vim']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

" refresh nerdtree
set autoread
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

" vim-go
" Don't show warnings if we are not using nvim or > 7.4.1099, thanks RedHat...
let g:go_version_warning = 0
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1

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

" vim AutoSave
let g:auto_save = 1  " enable AutoSave on Vim startup

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

" neoterm
let g:neoterm_default_mod='belowright' " open terminal in bottom split
let g:neoterm_size=16 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command

" floatterm
let g:floaterm_autoinsert=1
let g:floaterm_width=0.9
let g:floaterm_height=0.4
let g:floaterm_autoclose=1
let g:floaterm_position='bottom'
let g:floaterm_title='ft: $1/$2'
hi FloatermBorder ctermfg=cyan

" vim sneak
let g:sneak#label = 1

" Ranger
let g:ranger_map_keys = 0
nnoremap <silent> <leader>r :Ranger<CR>.
