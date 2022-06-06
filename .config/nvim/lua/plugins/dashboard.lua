-- Documentation: https://github.com/glepnir/dashboard-nvim
PACKER.use {
	'glepnir/dashboard-nvim',
	requires = {},
	config = function()
		vim.g.dashboard_default_executive = "telescope"
	end
}
