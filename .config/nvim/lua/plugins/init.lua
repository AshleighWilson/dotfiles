-- Install lazy.nvim https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Themes
	{ require('plugins.catppuccin') },

	-- Core plugins
	{ require('plugins.plenary') },
	{ require('plugins.nvim-webdev-icons') },
	{ require('plugins.nvim-cmp') },
	{ require('plugins.lspconfig') },
	{ require('plugins.treesitter') },

	-- Usability
	{ require('plugins.bufferline') }, -- Tab line
	{ require('plugins.which-key') }, -- View keyboard shortcuts
	{ require('plugins.lastplace') }, -- Remember where we were
	{ require('plugins.luasnip') }, -- Snippets
	{ require('plugins.comment') }, -- Comment code
	{ require('plugins.suda') }, -- Save files as root
	{ require('plugins.indent-blankline') }, -- Auto indenting
	{ require('plugins.orgmode') }, -- Org mode
	-- { require('plugins.whitespace') }, -- Trailing whitespace
	{ require('plugins.autopairs') },
	-- require('plugins.neorg')

	-- User interface
	{ require('plugins.nvim-tree') }, -- File explorer
	{ require('plugins.lualine') }, -- Status line
	{ require('plugins.telescope') }, -- Picker
	{ require('plugins.toggleterm') }, -- Terminal in neovim
	{ require('plugins.gitsigns') }, -- Git status
	{ require('plugins.colorizer') }, -- Preview colours
	{ require('plugins.todo-comments') }, -- Highlight keywords
	{ require('plugins.dashboard') }, -- Startup screen
})

