require("nvim-treesitter").setup {
	ensure_installed = { 'vim', 'vimdoc', 'lua', 'c', 'ruby' },
	auto_install = false,
	highlight = { endable = true },
	indent = { enable = true },

}
