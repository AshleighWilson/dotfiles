-- https://github.com/nvim-treesitter/nvim-treesitter
PACKER.use {
	'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
	config = function()
		local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

		-- These two are optional and provide syntax highlighting
		-- for Neorg tables and the @document.meta tag
		parser_configs.norg_meta = {
			install_info = {
				url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
				files = { "src/parser.c" },
				branch = "main"
			},
		}

		parser_configs.norg_table = {
			install_info = {
				url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
				files = { "src/parser.c" },
				branch = "main"
			},
		}

		require('nvim-treesitter.configs').setup {
			ensure_installed = {
				"c",
				"cpp",
				"css",
				"lua",
				"norg",
				"norg_meta",
				"norg_table",
			},
			highlight = {
				enable = true,
			}
		}
	end
}
