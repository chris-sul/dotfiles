-- nvim treesitter
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	ensure_installed = { "go", "python", "typescript" },
})

-- nvim treesitter context
require("treesitter-context").setup({
	enable = false,
	max_lines = 10,
	trim_scope = 'inner',
})
