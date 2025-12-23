return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = {
        'bash', 'go', 'python', 'lua', 'comment', 'json', 'regex', 'yaml', 'rust', 'hcl'
      },
      highlight = { enable = true },
    }
  end
}
