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


  Plug('joshdick/onedark.vim', {as= 'onedark'} )

  Plug('ryanoasis/vim-devicons')

  -- Utils
  Plug('sheerun/vim-polyglot')
  Plug('easymotion/vim-easymotion')
  Plug('tpope/vim-surround')
  Plug('jiangmiao/auto-pairs')
  Plug('nvim-lua/plenary.nvim')

  Plug('nvim-telescope/telescope.nvim')
  Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})

  Plug('kyazdani42/nvim-web-devicons')
  Plug('kyazdani42/nvim-tree.lua')

  Plug('vim-test/vim-test')

  Plug('github/copilot.vim')

  Plug('wakatime/vim-wakatime')

  Plug('ThePrimeagen/harpoon')

  Plug('junegunn/fzf', {['do'] = 'install'})
  Plug('junegunn/fzf.vim')


  -- Completion / linters / formatters
  Plug('nvim-treesitter/nvim-treesitter', {['do']= ':TSUpdate' })
  Plug('prettier/vim-prettier', {['do']= 'yarn install --frozen-lockfile --production' })
  Plug('rust-lang/rust.vim')

  -- lsp
  Plug('neovim/nvim-lspconfig', {['branch']= 'master', ['do']= 'yarn install' })

  -- Completion
  Plug('hrsh7th/cmp-nvim-lsp')
  Plug('hrsh7th/cmp-buffer')
  Plug('hrsh7th/cmp-path')
  Plug('hrsh7th/cmp-cmdline')
  Plug('hrsh7th/nvim-cmp')

  -- Git
  Plug('mhinz/vim-signify')

vim.call ('plug#end')

-- allow multiple signs per line
execute('set signcolumn=yes:2')

local map = vim.api.nvim_set_keymap

-- rust vim
execute('let g:rustfmt_autosave = 1')

-- prettier
execute('au FileType js,ts,css, let g:prettier#autoformat = 1')
execute('au FileType js,ts,css let g:prettier#autoformat_require_pragma = 0')

-- lsp setup
local opts = { noremap = true, silent = true }
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Harpoon
map('n', '<leader>m', '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<leader>h', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- diagnostic config
vim.diagnostic.config({
  virtual_text= false
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- lsp completion
vim.api.nvim_command('set completeopt=menu,menuone,noselect')

local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { 'gopls', 'sumneko_lua', 'tsserver', 'eslint', 'rust_analyzer', 'solargraph' }
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

-- nvim treesitter
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "go",
  },
}

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

execute('syntax on')
execute('colorscheme onedark')

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

-- FZF
vim.api.nvim_set_keymap(
  "n",
  "<leader>ff",
  ":Files<cr>",
  { noremap = true, silent=true }
)

-- Telescope
require('telescope').load_extension('fzf')
--vim.api.nvim_set_keymap(
--  "n",
--  "<leader>ff",
-- ":lua require('telescope.builtin').find_files()<cr>",
--  { noremap = true, silent=true }
--)

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

