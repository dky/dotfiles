" default colors for CursorLine
" https://jonasjacek.github.io/colors
"Figure out what comment highting is set to. You can also use :highlight to
"dump everything
":verbose hi comment
hi CursorLine ctermbg=236
hi LineNr ctermbg=236 ctermfg=246
hi Visual ctermbg=190 ctermfg=16
hi Comment ctermfg=43
" search colors
hi Search cterm=NONE ctermfg=white ctermbg=238

" spelling and dictionary support
" vim underline spelling errors don't color them.
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
hi SpellCap cterm=underline ctermfg=yellow
hi SpellLocal cterm=underline
hi SpellRare cterm=underline

" change Color when entering Insert Mode to indicate the current active line
autocmd InsertEnter * hi CursorLine ctermbg=24
" comment was too dark so decided to make it a easier color.
autocmd InsertEnter * hi Comment ctermfg=43
" revert Color to default when leaving Insert Mode
"
autocmd InsertLeave * hi CursorLine ctermbg=236
autocmd InsertLeave * hi Comment ctermfg=59
