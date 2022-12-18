-- https://github.com/catppuccin/nvim
PACKER.use {
	"catppuccin/nvim", as = "catppuccin"
}

require("catppuccin").setup({
	flavour = "frappe",
	integrations = {
--		dashboard = true,
--		gitsigns = true,
--		indent_blankline = { enabled = true },
--		native_lsp = { enabled = true },
--		cmp = true,
--		nvimtree = true,
--		treesitter = true,
	},
	vim.cmd.colorscheme "catppuccin-frappe",
})
