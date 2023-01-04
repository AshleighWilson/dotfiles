-- Documentation: https://github.com/windwp/nvim-autopairs
PACKER.use {
	'windwp/nvim-autopairs',
	requires = {},
	config = function()
		require('nvim-autopairs').setup {
		}
	end
}
