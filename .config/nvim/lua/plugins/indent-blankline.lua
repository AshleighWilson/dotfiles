-- Documentation: https://github.com/lukas-reineke/indent-blankline.nvim
PACKER.use {
	'lukas-reineke/indent-blankline.nvim',
	requires = {},
	config = function()
		require('indent_blankline').setup {
    			show_current_context = true,
    			show_current_context_start = false,
			filetype_exclude = {'dashboard'}
		}
	end
}

