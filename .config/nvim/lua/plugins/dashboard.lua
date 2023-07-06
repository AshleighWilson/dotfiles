-- Documentation: https://github.com/glepnir/dashboard-nvim
return {
	'glepnir/dashboard-nvim',
	dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-tree/nvim-web-devicons' },
	event = "VimEnter",
	config = function()
		vim.g.dashboard_default_executive = "telescope"
		require('dashboard').setup {
			config = {
				header = {
					"                                                       ",
					" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
					" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
					" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
					" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
					" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
					" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
					"                                                       ",
				},
				shortcut = {
					{
						desc = ' Update',
						group = '@property',
						action = 'Lazy update',
						key = 'u' },
					{
						icon = ' ',
						icon_hl = '@variable',
						desc = 'Files',
						group = 'Label',
						action = 'Telescope find_files',
						key = 'f',
					},
					{
						desc = ' Apps',
						group = 'DiagnosticHint',
						action = 'Telescope app',
						key = 'a',
					},
					{
						desc = ' dotfiles',
						group = 'Number',
						action = 'Telescope dotfiles',
						key = 'd',
					},
				}
			}
		}
	end,
}

