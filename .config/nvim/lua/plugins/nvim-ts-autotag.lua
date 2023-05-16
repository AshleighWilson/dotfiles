-- Documentation: https://github.com/windwp/nvim-ts-autotag
return {
	'windwp/nvim-ts-autotag',
	config = function ()
		require("nvim-ts-autotag").setup({
			filetypes = { "html", "xml", "htmldjango" },
		})
	end
}
