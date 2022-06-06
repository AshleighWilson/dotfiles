-- https://github.com/L3MON4D3/LuaSnip
-- https://sbulav.github.io/vim/neovim-setting-up-luasnip/
PACKER.use {
    'L3MON4D3/LuaSnip',
    after = "nvim-cmp",
    requires = {
    },
   	config = function()
		luasnip = require('luasnip')
		require("luasnip.loaders.from_snipmate").load()
	end
}
