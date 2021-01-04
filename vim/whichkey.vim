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
let g:leader_map['h'] = [ '<C-W>s'                     , 'split below']
let g:leader_map['v'] = [ '<C-W>v'                     , 'split right']
let g:leader_map['f'] = [ 'Files'                      , 'Search all files in current Git Repo' ]
let g:leader_map['F'] = [ 'Find'                       , 'Use Rg + Fzf to find files' ]
let g:leader_map['q'] = [ '<c-c>'                      , 'Quit FZF search' ]
let g:leader_map['r'] = [ 'RnvimrToggle'               , 'Ranger Search' ]
let g:leader_map['c'] = [ ':!pwd'                      , 'Current working dir' ]
let g:leader_map['a'] = [ 'ALEFix'                     , 'ALEFix it' ]

" s is for search
let g:leader_map.s = {
      \ 'name' : '+search' ,
      \ 'b' : [':BLines'        , 'Search current buffer'],
      \ 'B' : [':Lines'         , 'Search all **open** buffers'],
      \ 'f' : [':GFiles'        , 'Search only files in Git'],
      \ }

let g:leader_map.t = {
      \ 'name' : '+floatterm: ' ,
      \ 's' : [':FloatermShow'        , 'Show Floaterm'],
      \ '1' : [':FloatermNew'         , 'New Floaterm'],
      \ 'n' : [':FloatermNext'        , 'New Floaterm'],
      \ 'p' : [':FloatermPrev'        , 'Prev Floaterm'],
      \ 't' : [':FloatermToggle'      , 'Toggle Floaterm'],
      \ }

let g:leader_map.g = {
      \ 'name' : '+git' ,
      \ 's' : [':Git status'          , 'git status'],
      \ 'b' : [':Git branch'          , 'git branch'],
      \ 'a' : [':Git branch -a'       , 'git branch -a'],
      \ '1' : [':Git commit --amend'  , 'git commit --amend'],
      \ 'r' : [':Git reset --hard'    , 'git reset --hard'],
      \ }

let g:leader_map.m = {
      \ 'name' : '+misc' ,
      \ 'c' : [':call CloseAllBuffersButCurrent()'   , 'close all buffers except current'],
      \ '1' : [':call CreateDailyFolder()'           , 'create folder with current date'],
      \ '2' : [':call CopyCurrentFile()'             , 'create copy of current file'],
      \ 'b' : [':set ft=sh'                          , 'Set filetype to sh'],
      \ 'p' : [':set ft=python'                      , 'Set filetype to python'],
      \ }

" localleader mappings
let g:localleader_map['t'] = [ 'TestFile'                   , 'TestFile']
let g:localleader_map['q'] = [ '<c-c>'                      , 'Quit FZF search' ]

let g:localleader_map.c = {
      \ 'name' : '+codi' ,
      \ 'c' : [':Codi'         , 'Start Codi'],
      \ 't' : [':Codi!'        , 'Toggle Codi'],
      \ }

let g:localleader_map.1 = {
      \ 'name' : '+test' ,
      \ 't' : [':TestFile'        , 'TestFile'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:leader_map")
call which_key#register(',', "g:localleader_map")
