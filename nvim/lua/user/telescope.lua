local vim = vim
local fn = vim.fn

-- Remaps for Telescope
vim.api.nvim_set_keymap("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>", {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<cr>", {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap("n", "<leader>fg", ":Rg<cr>", {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap("n", "<leader>ffB", ":Telescope file_browser<cr>", {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap("n", "<space>ffb", ":Telescope file_browser path=%:p:h select_buffer=true<cr>", {
	noremap = true
})

-- Telescope
require("telescope").setup {
	extensions = {
		file_browser = {
			hidden = true,
			initial_mode = "normal"
		},
	},
	pickers = {
		find_files = {
			find_command = { 'rg', '--files', '--hidden', '-g', '!.git' }
		},
		buffers = {
			initial_mode = "normal"
		}
	}
}

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
