" LSP diagnostics on hover
"autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Let there be signs
sign define LspDiagnosticsSignError text=✖
sign define LspDiagnosticsSignWarning text=⚠
sign define LspDiagnosticsSignInformation text=ℹ
sign define LspDiagnosticsSignHint text=➤
