-- https://github.com/akinsho/bufferline.nvim
PACKER.use {
	'akinsho/bufferline.nvim',
	tag = "*",
	requires = {'kyazdani42/nvim-web-devicons'},
	config = function()
		require('bufferline').setup {
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
		}
  	end
}
