local vim = vim
local fn = vim.fn

vim.api.nvim_set_keymap("n", "<leader>ff", ":Files<cr>", {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap("n", "<leader>fg", ":Rg<cr>", {
	noremap = true,
	silent = true,
})

-- Telescope
require("telescope").load_extension("fzf")

vim.api.nvim_set_keymap("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>", {
	noremap = true,
	silent = true,
})
