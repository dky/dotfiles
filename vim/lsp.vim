"call compe for python and go for now
autocmd BufNewFile,BufRead *.py,*.go source ~/.dotfiles/lua/compe-config.lua
"Only use coc completion for markdown files, with the coc-dictionary
"extension, everything else should use nvim compe until multifile
"dictionary support is added
"coc-plugin is only enabled for markdown files see plug.vim
autocmd BufNewFile,BufRead *.md source ~/.dotfiles/vim/coc.vim

" LSP diagnostics on hover
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Let there be signs
sign define LspDiagnosticsSignError text=🔴
sign define LspDiagnosticsSignWarning text=🟠
sign define LspDiagnosticsSignInformation text=🔵
sign define LspDiagnosticsSignHint text=🟢
