local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- Pull in vimrc
execute('source ~/.vimrc')

-- Plugins

-- ensure that plug is installed
local install_path = '~/.config/nvim/autoload/plug.vim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  -- need to install somehow
  execute('autocmd VimEnter * PlugInstall | source $MYVIMRC')

end

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

  Plug('neovim/nvim-lspconfig')
  Plug('nvim-lua/plenary.nvim')
  Plug('nvim-telescope/telescope.nvim')
  Plug('morhetz/gruvbox')
  Plug('easymotion/vim-easymotion')
  Plug('tpope/vim-surround')
  Plug('tpope/vim-fugitive')
  Plug('vim-airline/vim-airline')

vim.call ('plug#end')

execute('autocmd vimenter * ++nested colorscheme gruvbox')

-- Colors

if fn.empty('$TMUX') then
  --if fn.has("nvim") then
  --  local $NVIM_TUI_ENABLE_TRUE_COLOR=1
  --end

  if fn.has("termguicolors") then
    execute('set termguicolors')
  end
end

execute('set t_Co=256')
execute('let g:airline_powerline_fonts = 1')

-- Custom Config
vim.g.mapleader = ' '

vim.api.nvim_set_keymap(
  "n",
  "<leader>ff",
  ":lua require('telescope.builtin').find_files()<cr>",
  { noremap = true, silent=true }
)

