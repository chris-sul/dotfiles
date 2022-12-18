local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- Ensure that Plug is installed
local install_path = "~/.config/nvim/autoload/plug.vim"
if fn.empty(fn.glob(install_path)) > 0 then
	execute(
		"silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	)
	-- need to install somehow
	execute("autocmd VimEnter * PlugInstall | source $MYVIMRC")
end

-- Install Plugins
local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.config/nvim/plugged")

-- Greeter
Plug("goolord/alpha-nvim")

-- Status Bar
Plug("vim-airline/vim-airline")

-- Appearance
Plug("joshdick/onedark.vim", {
	as = "onedark",
})
Plug("ryanoasis/vim-devicons")
Plug("kyazdani42/nvim-web-devicons")

-- Language Highlighting
Plug("sheerun/vim-polyglot")

-- Vim motion
Plug("easymotion/vim-easymotion")
Plug("tpope/vim-surround")

-- Useful Utils
Plug("jiangmiao/auto-pairs")
Plug("nvim-lua/plenary.nvim")
Plug("ThePrimeagen/harpoon")

-- Telescope
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-telescope/telescope-fzf-native.nvim", {
	["do"] = "make",
})

-- Nvim Tree
Plug("kyazdani42/nvim-tree.lua")

-- fzf
Plug("junegunn/fzf", {
	["do"] = "install",
})
Plug("junegunn/fzf.vim")

-- linters / formatters
Plug("nvim-treesitter/nvim-treesitter", {
	["do"] = ":TSUpdate",
})
Plug("nvim-treesitter/nvim-treesitter-context")
Plug("prettier/vim-prettier", {
	["do"] = "yarn install --frozen-lockfile --production",
})

-- Lsp
Plug("neovim/nvim-lspconfig", {
	["branch"] = "master",
	["do"] = "yarn install",
})
Plug("jose-elias-alvarez/null-ls.nvim")

-- completion
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/vim-vsnip")

-- Git
Plug("mhinz/vim-signify")

vim.call("plug#end")
