require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      'bash', 'go', 'python', 'lua', 'comment', 'json', 'regex', 'yaml', 'rust'
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
