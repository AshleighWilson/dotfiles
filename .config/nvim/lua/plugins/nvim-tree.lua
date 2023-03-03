-- https://github.com/kyazdani42/nvim-tree.lua
return {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
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

