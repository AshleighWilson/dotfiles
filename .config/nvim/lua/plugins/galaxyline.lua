-- https://github.com/NTBBloodbath/galaxyline.nvim
PACKER.use {
	"NTBBloodbath/galaxyline.nvim",
  	-- your statusline
  	config = function()
    		require("galaxyline.themes.eviline")
  	end,
  	-- some optional icons
  	requires = { "nvim-tree/nvim-web-devicons", opt = true }
}
