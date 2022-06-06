-- Documentation: https://github.com/nvim-neorg/neorg
PACKER.use {
	'nvim-neorg/neorg',
	requires = { 'nvim-lua/plenary.nvim', 'nvim-neorg/neorg-telescope' },
	config = function()
		require('neorg').setup {
			load = {
				["core.defaults"] = {},
				["core.norg.qol.toc"] = { config = {} },
				["core.norg.concealer"] = {
					config = { -- Note that this table is optional and doesn't need to be provided
						-- Configuration here
					},
				},
				["core.gtd.base"] = {
					config = {
						workspace = "default"
					}
				},
				["core.norg.dirman"] = {
					config = {
						workspaces = {
							default = vim.fn.getcwd(), -- Format: <name_of_workspace> = <path_to_workspace_root>
							-- my_other_notes = "~/work/notes",
						},
						autochdir = true, -- Automatically change the directory to the current workspace's root every time
						index = "index.norg", -- The name of the main (root) .norg file
						last_workspace = vim.fn.stdpath("cache") .. "/neorg_last_workspace.txt" -- The location to write and read the workspace cache file
					}
				},
				["core.norg.completion"] = {
					config = { -- Note that this table is optional and doesn't need to be provided
						engine = "nvim-cmp"		-- Configuration here
					}
				},
				["core.integrations.nvim-cmp"] = {
					config = { -- Note that this table is optional and doesn't need to be provided
								-- Configuration here
					}
				},
				["core.integrations.telescope"] = {}, -- Enable the telescope module
			}
		}
	end
}
