-- https://github.com/NTBBloodbath/galaxyline.nvim
PACKER.use {
	"NTBBloodbath/galaxyline.nvim",
  	-- your statusline
  	config = function()
    		require("galaxyline.themes.eviline")
  	end,
  	-- some optional icons
  	requires = { "kyazdani42/nvim-web-devicons", opt = true }
}
