" vim-go - This file handles the configuration of the vim-go plugin. The
" coc-completion plugin is handled in the coc-settings file.
" Don't show warnings if we are not using nvim or > 7.4.1099, thanks RedHat...
let g:go_version_warning = 0
let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
