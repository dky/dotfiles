" Map leader to which_key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\'<CR>

" Create map to add keys to
let g:which_key_map =  {}
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

" Single mappings
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
let g:which_key_map['f'] = [ 'Files'                      , 'Open file' ]

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ 'b' : [':BLines'        , 'Search current buffer'],
      \ 'B' : [':Lines'         , 'Search all **open** buffers'],
      \ }

" ale might yank this soon since coc has this
let g:which_key_map.a = {
      \ 'name' : '+ale' ,
      \ 'f' : [':AleFix'           , 'AleFix'],
      \ 't' : [':AleToggle'        , 'AleToggle on off'],
      \ }

let g:which_key_map.t = {
      \ 'name' : '+floatterm: ' ,
      \ 's' : [':FloatermShow'        , 'Show Floaterm'],
      \ '1' : [':FloatermNew'         , 'New Floaterm'],
      \ 'n' : [':FloatermNext'        , 'New Floaterm'],
      \ 'p' : [':FloatermPrev'        , 'Prev Floaterm'],
      \ 't' : [':FloatermToggle'      , 'Toggle Floaterm'],
      \ }

let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 's' : [':Git status'          , 'git status'],
      \ 'b' : [':Git branch'          , 'git branch'],
      \ 'a' : [':Git branch -a'       , 'git branch -a'],
      \ '1' : [':Git commit --amend'  , 'git commit --amend'],
      \ 'r' : [':Git reset --hard'    , 'git reset --hard'],
      \ }

let g:which_key_map.m = {
      \ 'name' : '+misc' ,
      \ 'c' : [':call CloseAllBuffersButCurrent()'        , 'close all buffers except current'],
      \ '1' : [':call CreateDailyFolder()'           , 'create folder with current date'],
      \ '2' : [':call CopyCurrentFile()'             , 'create copy of current file'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
