local vim = vim

-- Ensure that Lazy is installed
local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Installing Lazy...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Plugins
require("lazy").setup({
	-- Greeter
	"goolord/alpha-nvim",

	-- Status Bar
	"nvim-lualine/lualine.nvim",

	-- Appearance
	"catppuccin/nvim",
	"ryanoasis/vim-devicons",
	"kyazdani42/nvim-web-devicons",

	-- Language Highlighting
	"sheerun/vim-polyglot",

	-- Vim motion
	"easymotion/vim-easymotion",
	"tpope/vim-surround",

	-- Useful Utils
	"jiangmiao/auto-pairs",
	"nvim-lua/plenary.nvim",
	"ThePrimeagen/harpoon",
	"folke/which-key.nvim",

	-- Telescope
	"nvim-telescope/telescope.nvim",
	{"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
	"nvim-telescope/telescope-file-browser.nvim",

	-- Removing this to try out telescope file browser
	-- Nvim Tree
	-- "kyazdani42/nvim-tree.lua",

	-- fzf
	"junegunn/fzf",
	"junegunn/fzf.vim",

	-- linters / formatters
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	"nvim-treesitter/nvim-treesitter-context",
	{"prettier/vim-prettier", build = "yarn install --frozen-lockfile --production"},

	-- Lsp
	{"neovim/nvim-lspconfig", branch = "master", build = "yarn install"},
	"jose-elias-alvarez/null-ls.nvim",
	"SmiteshP/nvim-navic",

	-- completion
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"hrsh7th/vim-vsnip",

	-- Git
	"mhinz/vim-signify",
})
