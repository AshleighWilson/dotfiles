-- https://github.com/kyazdani42/nvim-tree.lua
return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
    	actions = {
			open_file = { quit_on_open = true }
		},
		renderer = {
			indent_markers = { enable = true },
			add_trailing = true, -- Add trailing slash on folders
		}
    }
}

