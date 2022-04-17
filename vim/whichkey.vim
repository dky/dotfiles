" Map leader to which_key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Create map to add keys to
let g:leader_map =  {}
let g:localleader_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100
" Don't float
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" leader mappings
let g:leader_map['c'] = [ ':!pwd'                            , 'Current working dir' ]
let g:leader_map['f'] = [ 'Files'                            , 'Search all files in current Git Repo' ]
let g:leader_map['F'] = [ 'Find'                             , 'Custom Find() Use Rg + Fzf to find files' ]
let g:leader_map['h'] = [ '<C-W>s'                           , 'split below']
let g:leader_map['j'] = [ '<C-W>w'                           , 'jump splits']
"let g:leader_map['t'] = [ ':Reserved - Don't use            , 'This is already being mapped via floaterm.vim, do not re-use it.']
let g:leader_map['t'] = [ ':FloatermToggle'                  , 'Toggle Floaterm, space space also does this']
let g:leader_map['o'] = [ ':set conceallevel=0'              , 'No Conceal' ]
let g:leader_map['p'] = [ '<M-p>'                            , 'Toggle Autopairs' ]
let g:leader_map['q'] = [ ':bd'                              , 'Buffer close to ease having to type :bd' ]
let g:leader_map['w'] = [ ':!tmux new-window bash -ci fp'    , 'Switch tmux sessions' ]
"let g:leader_map['r'] = [ ':Reserved - Don't use            , 'Plan to use this to run files similar to F8.' ]
let g:leader_map['v'] = [ '<C-W>v'                           , 'split right']
let g:leader_map['y'] = [ ':FloatermSend pytest'             , 'Send pytest to floatterm' ]
let g:leader_map['z'] = [ ':call TrimTrailingLineSpace()'    , 'Call TrimTrailingLineSpace() function to get rid of trailing lines' ]

let g:leader_map.a = {
      \ 'name' : '+neoformat' ,
      \ 'p' : ['Neoformat'        , 'Run Neoformat on Python files'],
      \ }

let g:leader_map.e = {
      \ 'name' : '+edit' ,
      \ 'r' : [':call EditLangFile("rb")'            , 'Open a ruby tmp file for editing'],
      \ 'g' : [':call EditLangFile("go")'            , 'Open a go tmp file for editing'],
      \ }

"Git mappings
let g:which_key_map =  {}
let g:which_key_map.g = { 'name' : '+git' }

nnoremap <silent> <leader>gs :Git status<CR>
let g:which_key_map.g.s = 'git-status'

nnoremap <silent> <leader>gb :Git checkout -b 
let g:which_key_map.g.b = 'git-branch'

nnoremap <silent> <leader>gsw :Git switch -c
let g:which_key_map.g.sw = 'git-switch'

nnoremap <silent> <leader>gco :Git checkout
let g:which_key_map.g.co = 'git-checkout'

nnoremap <silent> <leader>gpuo :Git push origin
let g:which_key_map.g.puo = 'git-push-origin'

nnoremap <silent> <leader>gpuc :Git -c push.default=current push<CR>
let g:which_key_map.g.puc = 'git-push-origin-current'

nnoremap <silent> <leader>gf :Git fetch<CR>
let g:which_key_map.g.f = 'fetch'

" Somewhat ugly but this works for now
nnoremap <silent> <leader>gplh :exec "Git pull --rebase origin " . fugitive#head()<cr>
let g:which_key_map.g.plh = 'git-pull-origin-head'

nnoremap <silent> <leader>gpuh :exec "Git push origin " . fugitive#head()<CR>
let g:which_key_map.g.puh = 'git-push-origin-head'

nnoremap <silent> <leader>gpuhf :exec "Git push origin --force " . fugitive#head()<CR>
let g:which_key_map.g.puhf = 'git-push-origin-head-force'

nnoremap <silent> <leader>gbl :Git blame<CR>
let g:which_key_map.g.bl = 'git-blame'

nnoremap <silent> <leader>gd :Git diff<CR>
let g:which_key_map.g.d = 'git-diff'

nnoremap <silent> <leader>gds :Git diff --staged<CR>
let g:which_key_map.g.ds = 'git-diff-staged'

nnoremap <silent> <leader>gaf :Git add . <CR>
let g:which_key_map.g.af = 'git-add-file-specific-or-single-file'

nnoremap <silent> <leader>ga :Git add .<CR>
let g:which_key_map.g.a = 'git-add-all'

nnoremap <silent> <leader>gcm :Git commit -m "
let g:which_key_map.g.cm = 'git-commit'

nnoremap <silent> <leader>gcma :Git add . <bar> :Git commit -a -m "
let g:which_key_map.g.cma = 'git-add-plus-commit'

nnoremap <silent> <leader>gl :Git log<CR>
let g:which_key_map.g.l = 'git-log'

let g:leader_map.n = {
      \ 'name' : '+floatterm: ' ,
      \ '1' : [':FloatermNew --autoclose=0 terraform plan'           , 'terraform plan'],
      \ '2' : [':FloatermNew --autoclose=0 terraform apply -auto-approve'          , 'terraform apply with auto-approve'],
      \ '3' : [':FloatermNew --autoclose=0 terraform destroy'        , 'terraform destroy'],
      \ 'a' : [':FloatermNew --autoclose=0 ansible-playbook -i inventory.yml -v %'    , 'ansible-playbook apply'],
      \ 'p' : [':FloatermNew --autoclose=0 python3 %'                , 'run current buffer with python in float'],
      \ 'ft' : [':Floaterms'                                         , 'Use fzf to find terms'],
      \ 'fn' : [':FloatermNext'                                      , 'Next Floaterm'],
      \ 'fp' : [':FloatermPrev'                                      , 'Prev Floaterm'],
      \ 'dk' : [':FloatermSend mp d'                                 , 'Make public dky'],
      \ 'g' : [':call FtGo()'                                        , 'Open go specific floaterm'],
      \ 'gt' : [':FloatermSend --name=go go test'                    , 'Go test to a term'],
      \ }


let g:leader_map.m = {
      \ 'name' : '+misc' ,
      \ 'c' : [':call CloseAllBuffersButCurrent()'   , 'close all buffers except current'],
      \ '1' : [':call CreateDailyFolder()'           , 'create folder with current date'],
      \ '2' : [':call CopyCurrentFile()'             , 'create copy of current file'],
      \ 'b' : [':set ft=sh'                          , 'Set filetype to sh'],
      \ 'p' : [':set ft=python'                      , 'Set filetype to python'],
      \ 'r' : [':FloatermNew ranger'                 , 'Call ranger from floaterm'],
      \ }

let g:leader_map.s = {
      \ 'name' : '+search' ,
      \ 'b' : [':BLines'        , 'Search current buffer'],
      \ 'B' : [':Lines'         , 'Search all **open** buffers'],
      \ 'f' : [':GFiles'        , 'Search only Git checked in files'],
      \ }

" localleader \ mappings
"let g:localleader_map['t'] = [ 'TestFile'                                    , 'TestFile']
let g:localleader_map['t'] = [':FloatermNew --autoclose=0 pytest .'          , 'run pytest']
let g:localleader_map['p'] = [':FloatermNew --autoclose=0 python3 %'         , 'run current buffer with python in float']

let g:localleader_map.g = {
      \ 'name' : '+go' ,
      \ 'f' : [':GoFmt'         , 'Go Fmt']
      \ }

let g:localleader_map.c = {
      \ 'name' : '+codi' ,
      \ 'c' : [':Codi'         , 'Start Codi'],
      \ 'd' : [':Codi!'        , 'Deactivate Codi'],
      \ 't' : [':Codi!!'       , 'Toggle Codi'],
      \ }

let g:localleader_map.1 = {
      \ 'name' : '+test' ,
      \ 't' : [':TestFile'        , 'TestFile'],
      \ }

" surround maps are defined in maps.vim
let g:localleader_map.s = {
      \ 'name' : '+surround' ,
      \ 'p' : [',sp'        , 'Surround Python code with print()'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:leader_map")
call which_key#register(',', "g:localleader_map")

"Clear out highlighting from search
map <silent><leader>l :nohl<CR>
" Space + Space brings up toggles floaterm
nmap <silent><leader><leader> :FloatermToggle<CR>
