-- https://github.com/L3MON4D3/LuaSnip
-- https://sbulav.github.io/vim/neovim-setting-up-luasnip/
return {
    'L3MON4D3/LuaSnip',
    dependencies = "nvim-cmp",
   	config = function()
		luasnip = require('luasnip')
		require("luasnip.loaders.from_snipmate").load()
	end
}
