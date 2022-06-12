
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- https://github.com/nanotee/nvim-lua-guide

function augroup(name, autocmds)
  vim.cmd('augroup ' .. name)
  vim.cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    vim.cmd('autocmd ' .. autocmd)
  end
  vim.cmd('augroup END')
end

-- Plugins
require('plugins')

--Remap space as leader key
-- vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set key press timeout (i.e. for which-key)
vim.opt.timeoutlen=500

vim.wo.colorcolumn = "80"

vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true -- enable colorscheme support
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- spaces per tab (when shifting), when using the >> or << commands, shift lines by 4 spaces
vim.opt.smarttab = true -- <tab>/<BS> indent/dedent in leading whitespace
vim.opt.autoindent = true -- maintain indent of current line
vim.opt.expandtab = false -- don't expand tabs into spaces
vim.opt.shiftround = true
vim.opt.wrap = false

-- Custom file types
vim.cmd 'autocmd BufRead,BufNewFile *.rasi set filetype=css'

-- Reload neovim and plugins when configs are updated
vim.cmd([[
  augroup reload_config
    autocmd!
    autocmd BufWritePost init.lua luafile <afile>
    autocmd BufWritePost ~/.config/nvim/lua/plugins/*.lua lua require('plenary.reload').reload_module('plugins', false)
    autocmd BufWritePost ~/.config/nvim/lua/plugins/*.lua lua require('plugins')
    autocmd BufWritePost ~/.config/nvim/lua/plugins/*.lua PackerCompile
  augroup end
]])


