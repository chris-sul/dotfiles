local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

execute("syntax on")
execute("colorscheme catppuccin-frappe")

if fn.empty("$TMUX") then
	-- if fn.has("nvim") then
	--  local $NVIM_TUI_ENABLE_TRUE_COLOR=1
	-- end

	if fn.has("termguicolors") then
		execute("set termguicolors")
	end
end

execute("set t_Co=256")
execute("set laststatus=3")

require("lualine").setup({
	options = {
		theme = "auto",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = { "buffers" },
		lualine_x = { "tabs" },
		lualine_y = { "progress" },
		lualine_z = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic", "nvim_lsp" },
				sections = { "error", "warn", "info", "hint" },
				diagnostics_color = {
					-- Same values as the general color option can be used here.
					error = "DiagnosticError", -- Changes diagnostics' error color.
					warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
					info = "DiagnosticInfo", -- Changes diagnostics' info color.
					hint = "DiagnosticHint", -- Changes diagnostics' hint color.
				},
				globalstatus = true,
				icons_enabled = true,
				--symbols = { error = "E", warn = "W", info = "I", hint = "H" },
				colored = true, -- Displays diagnostics status in color if set to true.
				update_in_insert = false, -- Update diagnostics in insert mode.
				always_visible = false, -- Show diagnostics even if there are none.
			},
		},
	},
})
