-- Documentation: https://github.com/johnfrankmorgan/whitespace.nvim
return {
	'johnfrankmorgan/whitespace.nvim',
	dependencies= {},
	config = function()
		require('whitespace-nvim').setup({
        		highlight = '@text.danger',
        		ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help', 'dashboard' },
        	})

        	vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)
	end
}
