local vim = vim
local fn = vim.fn

-- Remaps for Telescope
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope file_browser<cr>", {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap("n", "<leader>ff", ":Files<cr>", {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap("n", "<leader>fg", ":Rg<cr>", {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap("n", "<leader>fB", ":lua require('telescope.builtin').buffers()<cr>", {
	noremap = true,
	silent = true,
})

-- Telescope
require("telescope").setup {
	extensions = {
    	file_browser = {
			initial_mode = "normal"
    	},
  	},
}

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

