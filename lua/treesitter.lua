require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		'bash', 'go', 'python', 'lua', 'comment', 'json', 'regex', 'yaml', 'rust', 'hcl'
	},
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	rainbow = {
		enable = true, -- This is used by the nvim-ts-rainbow plugin.
		extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
	}
}
