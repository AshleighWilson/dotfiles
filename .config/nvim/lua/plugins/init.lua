-- Install packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[packadd packer.nvim]]
PACKER = require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
end)

-- Core plugins
require('plugins.plenary')
require('plugins.nvim-webdev-icons')
require('plugins.lspconfig')
require('plugins.nvim-cmp')
require('plugins.treesitter')

-- Themes
require('plugins.catppuccin')

-- Usability
require('plugins.lastplace') -- Remember where we were
require('plugins.suda') -- Save files as root
require('plugins.luasnip') -- Snippets
require('plugins.comment') -- Comment code
require('plugins.indent-blankline') -- Auto indenting
require('plugins.orgmode') -- Org mode
-- require('plugins.neorg')

-- User interface
require('plugins.lualine') -- Status line
require('plugins.bufferline') -- Tab line
require('plugins.telescope') -- Picker
require('plugins.gitsigns') -- Git status
require('plugins.nvim-tree') -- File explorer
require('plugins.which-key') -- View keyboard shortcuts
require('plugins.colorizer') -- Preview colours
require('plugins.todo-comments') -- Highlight keywords
require('plugins.dashboard') -- Startup screen
require('plugins.toggleterm') -- Terminal in neovim

-- Automatically install required plugins after fresh install.
if packer_bootstrap then
	require('packer').sync()
end
