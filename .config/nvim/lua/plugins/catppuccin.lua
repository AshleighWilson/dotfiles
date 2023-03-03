-- https://github.com/catppuccin/nvim
return {
	"catppuccin/nvim", name = "catppuccin",
	opts = {
		integrations = {
--		dashboard = true,
--		gitsigns = true,
--		indent_blankline = { enabled = true },
--		native_lsp = { enabled = true },
--		cmp = true,
		nvimtree = true,
--		treesitter = true,
		},
		vim.cmd.colorscheme "catppuccin-frappe",
	}
}

