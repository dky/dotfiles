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

" change Color dark blue when entering Insert Mode to indicate the current active line
" commented this out because the blue during insert mode is horrid, this would
" highlight the line all in blue which was really hard to see things.
"autocmd InsertEnter * hi CursorLine ctermbg=24
" comment was too dark so decided to make it a easier color.
autocmd InsertEnter * hi Comment ctermfg=43
" revert Color to default when leaving Insert Mode
"
"autocmd InsertLeave * hi CursorLine ctermbg=236
autocmd InsertLeave * hi Comment ctermfg=59

" subtle cmp popup styling (gui colors needed because termguicolors is on)
hi Pmenu guibg=#2d2d2d guifg=#b0b0b0
hi PmenuSel guibg=#3e3e3e guifg=#e0e0e0
hi PmenuSbar guibg=#333333
hi PmenuThumb guibg=#555555
hi CmpItemAbbrMatch guibg=NONE guifg=#7dafc2
hi CmpItemAbbrMatchFuzzy guibg=NONE guifg=#7dafc2
hi CmpItemAbbrDeprecated guibg=NONE guifg=#555555 gui=strikethrough
hi CmpItemKind guibg=NONE guifg=#777777
hi CmpItemMenu guibg=NONE guifg=#666666
