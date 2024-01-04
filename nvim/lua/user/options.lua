local vim = vim

local options = {
	autoread = true, -- when file changed, autoread it
	number = true, -- set line numbers
	ruler = true, -- always show current position
	ignorecase = true, -- ignore case when searching
	hlsearch = true, -- highlight search results
	expandtab = true, -- use spaces instead of tabs
	smarttab = true, -- be smart when using tabs
	shiftwidth = 4,
	tabstop = 4,
	ai = true, -- auto ident
	si = true, -- smart indent
	splitbelow = true, -- window management
	splitright = true, -- window management
	signcolumn = "yes:2", -- allow multiple signs per line (for git)
	colorcolumn = "80", -- color the 80 column
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
