-- https://github.com/nvim-telescope/telescope.nvim
return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-project.nvim' },
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

		require('telescope').load_extension('project')
  	end
}

