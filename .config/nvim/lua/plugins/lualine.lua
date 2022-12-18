-- https://github.com/nvim-lualine/lualine.nvim
PACKER.use {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

require('lualine').setup {
    options = {
        theme = "catppuccin"
    }
}
