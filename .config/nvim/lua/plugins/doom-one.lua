-- https://github.com/NTBBloodbath/doom-one.nvim
PACKER.use({
    'NTBBloodbath/doom-one.nvim',
    config = function()
        require('doom-one').setup({
            cursor_coloring = false,
            terminal_colors = false,
            italic_comments = false,
            enable_treesitter = true,
            transparent_background = false,
            pumblend = {
                enable = false,
                transparency_amount = 80,
            },
            plugins_integrations = {
                neorg = true,
                barbar = true,
                bufferline = false,
                gitgutter = false,
                gitsigns = true,
                telescope = false,
                neogit = true,
                nvim_tree = true,
                dashboard = true,
                startify = true,
                whichkey = true,
                indent_blankline = true,
                vim_illuminate = true,
                lspsaga = false,
            },
        })

	require("doom-one").load_colorscheme()
    end,
})

