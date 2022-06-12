-- Documentation: https://github.com/nvim-orgmode/orgmode
PACKER.use {
	'nvim-orgmode/orgmode',
	requires = { 'akinsho/org-bullets.nvim', 'nvim-treesitter/nvim-treesitter' },
	config = function()
		require('orgmode').setup {
			-- Load custom tree-sitter grammar for org filetype
			mappings = {
				disable_all = true
			}
		}
		
		require('orgmode').setup_ts_grammar()

		-- Tree-sitter configuration
		require'nvim-treesitter.configs'.setup {

			-- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
			highlight = {
				enable = true,
				disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
				additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
			},
			ensure_installed = {'org'}, -- Or run :TSUpdate org
		}

		require('orgmode').setup({
			org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
			org_default_notes_file = '~/Dropbox/org/refile.org'
		})

		require("org-bullets").setup {
			symbols = { "◉", "○", "✸", "✿" }
		}
	end
}

