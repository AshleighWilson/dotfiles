-- https://github.com/akinsho/bufferline.nvim
return {
	'akinsho/bufferline.nvim',
	dependencies = {'kyazdani42/nvim-web-devicons'},
	opts = {	
		options = {
			always_show_bufferline = false,
			offsets = {
				{
    				filetype = "NvimTree",
    				text = "File Explorer",
    				highlight = "Directory",
    				text_align = "left"
  				}
			}
		},
		highlights = require("catppuccin.groups.integrations.bufferline").get(),
	}
}
