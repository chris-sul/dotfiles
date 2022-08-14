local vim = vim
local opts = { noremap = true, silent = true }
local opts_expr = { noremap = true, silent = true, expr = true }
local opts2 = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("i", "jk", "<ESC>", opts2)
keymap("n", "Y", "y$", opts) -- yank whole line

-- pum navigation
local function pumvisible()
	return vim.fn.pumvisible ~= 0
end
local function pum_nav_down()
	if pumvisible() then
		return "<C-n>"
	else
		return "<C-j>"
	end
end
local function pum_nav_up()
	if pumvisible() then
		return "<C-p>"
	else
		return "<C-k>"
	end
end
keymap("i", "<C-j>", ":lua pum_nav_down<CR>", opts_expr)
keymap("i", "<C-k>", ":lua pum_nav_up<CR>", opts_expr)

-- window management
keymap("n", "<C-J>", "<C-W><C-J>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)
