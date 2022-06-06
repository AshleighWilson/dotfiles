-- https://github.com/nvim-telescope/telescope.nvim
PACKER.use {
	'nvim-telescope/telescope.nvim',
	requires = 'nvim-lua/plenary.nvim',
	config = function()
		require('telescope').setup {
			defaults = {
				mappings = {
					i = {
						["<C-h>"] = "which_key"
					}
				}
			},
			pickers = {
		  		find_files = {
			  		find_command = { "rg", "--hidden", "--ignore", "--files" }
		  		}
	  		},
			extensions = {
	  		}
		}
  	end
}

