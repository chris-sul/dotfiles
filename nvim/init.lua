local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- Pull in vimrc
execute('source ~/.vimrc')

if (vim.g.vscode) then
  -- vscode specific stuff 
  vim.g.mapleader = " "

else

  vim.g.mapleader = " "
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

  -- Apperance
  Plug('vim-airline/vim-airline')
  Plug('dracula/vim', {as= 'dracula'} )
  --Plug('ryanoasis/vim-devicons')

  -- Utils
  Plug('sheerun/vim-polyglot')
  Plug('easymotion/vim-easymotion')
  Plug('tpope/vim-surround')
  Plug('jiangmiao/auto-pairs')
  Plug('nvim-lua/plenary.nvim')
  Plug('nvim-telescope/telescope.nvim')
  Plug('kyazdani42/nvim-web-devicons')
  Plug('kyazdani42/nvim-tree.lua')
  --Plug('junegunn/fzf', { ['do']= ':call fzf#install()' })
  --Plug('junegunn/fzf.vim')
  Plug('github/copilot.vim')

  -- Completion / linters / formatters
  Plug('neoclide/coc.nvim', {['branch']= 'master', ['do']= 'yarn install' })

  -- Git
  Plug('airblade/vim-gitgutter')

vim.call ('plug#end')

-- nvim tree setup 
require('nvim-tree').setup {}
vim.api.nvim_set_keymap(
  "n",
  "<C-n>",
  ":NvimTreeToggle<cr>",
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>r",
  ":NvimTreeRefresh<cr>",
  { noremap = true, silent=true }
)

-- switching buffers
vim.api.nvim_set_keymap(
  "n",
  "<C-J>",
  ":bnext<cr>",
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap(
  "n",
  "<C-K>",
  ":bprev<cr>",
  { noremap = true, silent=true }
)
-- Language server stuff
execute("command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')")

execute('let g:dracula_colorterm = 0')
execute('colorscheme dracula')

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
execute('let g:airline#extensions#tabline#enabled = 1')

-- Telescope
vim.api.nvim_set_keymap(
  "n",
  "<leader>ff",
  ":lua require('telescope.builtin').find_files()<cr>",
  { noremap = true, silent=true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  ":lua require('telescope.builtin').buffers()<cr>",
  { noremap = true, silent=true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fg",
  ":lua require('telescope.builtin').live_grep()<cr>",
  { noremap = true, silent=true }
  )

end

