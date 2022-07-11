-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- ---------------------------
-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end
-- ---------------------------

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Theme
  use 'Mofiqul/dracula.nvim'

  -- Lualine
  use 'nvim-lualine/lualine.nvim'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Indent Blankline
  use "lukas-reineke/indent-blankline.nvim"

  -- AutoPairs
  use 'windwp/nvim-autopairs'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
