local vim = vim
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Harpoon
map("n", "<leader>m", '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
map("n", "<leader>h", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
