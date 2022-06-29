-- Documentation: https://github.com/akinsho/toggleterm.nvim#custom-terminals
PACKER.use {
	'akinsho/toggleterm.nvim',
	requires = {},
	config = function()
		require('toggleterm').setup {
			open_mapping = [[<C-\>]],
			shade_terminals = false
		}

		local Terminal  = require('toggleterm.terminal').Terminal

		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
		})

		function _lazygit_toggle()
			lazygit:toggle()
		end

		local serial_device = Terminal:new({
			cmd = "make serial",
			direction = "float",
			go_back = 0,
			close_on_exit = 0,
		})

		function _serial_device_toggle()
			serial_device:toggle()
		end
	end
}
