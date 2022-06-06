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

-- Load plugins
require('plugins.lspconfig')		-- TODO:
require('plugins.nvim-cmp')			-- TODO:
require('plugins.luasnip')			-- TODO:
require('plugins.dashboard')		-- TODO:
require('plugins.comment')			-- TODO:
require('plugins.which-key')		-- TODO:
require('plugins.doom-one')			-- TODO:
require('plugins.treesitter')		-- TODO:
require('plugins.telescope')		-- TODO:
require('plugins.todo-comments')	-- TODO:
require('plugins.galaxyline')		-- TODO:
require('plugins.bufferline')		-- TODO:
require('plugins.nvim-tree')		-- TODO:
require('plugins.indent-blankline') -- TODO:
require('plugins.suda')				-- TODO:
require('plugins.neorg')			-- TODO:
require('plugins.orgmode')			-- TODO:
require('plugins.colorizer')		-- TODO:
require('plugins.lastplace')		-- TODO:
require('plugins.gitsigns')			-- TODO:

-- Automatically install required plugins after fresh install.
if packer_bootstrap then
	require('packer').sync()
end
