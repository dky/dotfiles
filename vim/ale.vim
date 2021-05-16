" ale
let g:ale_linters = {'go': ['gometalinter', 'gofmt'],}
let g:ale_linters = {'javascript': ['eslint'],}
let g:ale_linters = {'python': ['flake8', 'pylint'],}
let g:ale_linters = {'markdown': ['proselint'],}
let g:ale_linters = {'ruby': ['standardrb', 'rubocop'],}

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fixers['vue'] = ['prettier', 'eslint']
let g:ale_fixers['python'] = ['remove_trailing_lines', 'isort', 'yapf']
let g:ale_fixers['ruby'] = ['standardrb']

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'

" We use coc so dont' do lsp
let g:ale_disable_lsp = 1

" Don't fix on every save please.
let g:ale_fix_on_save = 0

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'

let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 0

" Enable messages in airline
let g:airline#extensions#ale#enabled = 1
