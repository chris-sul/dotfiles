local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

execute("syntax on")
execute("colorscheme onedark")

if fn.empty("$TMUX") then
	-- if fn.has("nvim") then
	--  local $NVIM_TUI_ENABLE_TRUE_COLOR=1
	-- end

	if fn.has("termguicolors") then
		execute("set termguicolors")
	end
end

execute("set t_Co=256")

execute("let g:airline_powerline_fonts = 1")
execute("let g:airline#extensions#tabline#enabled = 1")

-- Global status line
execute("set laststatus=3")
