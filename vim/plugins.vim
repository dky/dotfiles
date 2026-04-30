" vim-go
source ~/.dotfiles/vim/vim-go.vim
" Autosave, transitioned off this because of weird errors with nvim autopairs,
" trying out nvim lua implementation
"let g:auto_save = 1  " enable AutoSave on Vim startup
"let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Rainbow Parenthesis
let g:rainbow_active = 1

" Codi
"let g:codi#width = winwidth(winnr()) / 2
let g:codi#rightalign = 0

"Disable semshi error sign and just let flake8 handle it.
let g:semshi#error_sign = v:false

let NERDTreeIgnore = ['\.pyc$', '\.go.mod$', '\.DS_Store$', '__pycache__', 'venv', '.git']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

" refresh nerdtree
"set autoread
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

" clangformat C code
let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -4,
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AlwaysBreakTemplateDeclarations" : "true",
			\ "Standard" : "C++11"}

set omnifunc=syntaxcomplete#Complete

" Moar FZF!
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0, 'highlight': 'Comment' } }

" This relies on the bat command for rendering terminal colors - brew install bat, this is also in the misc.sh script
" ctrl-/ toggles preview layout (right / bottom-tall / hidden); ctrl-u/d scroll the preview half a page.
let $FZF_DEFAULT_OPTS="--ansi --layout reverse --margin=1,4"
            \ . " --preview 'bat --color=always --style=numbers,changes --line-range :500 {}'"
            \ . " --preview-window 'right:60%:wrap'"
            \ . " --bind 'ctrl-/:change-preview-window(down,70%|hidden|)'"
            \ . " --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"

let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-i': 'split',
			\ 'ctrl-v': 'vsplit' }

" :Find or whichkey F opens ripgrep fzf to search files.
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, {'options': '--no-preview'}, <bang>0)

" mac dictionary
let g:vim_mac_dictionary_use_app = 1

" Shell command formatter, call this when editing ugly shell one liners with ctr-g
command! -range Fmtsh <line1>!format_shell_cmd.py

" indent-blankline-nvim
let g:indent_blankline_space_char = '⋅'

" terraform-vim plugin
"let g:terraform_fmt_on_save=1
let g:terraform_align=1

" plasticboy vim markdown disable folding
let g:vim_markdown_folding_disabled = 1

" vim sneak
let g:sneak#label = 1

"vim-test
let test#python#runner = 'pytest'
let test#strategy = "floaterm"
