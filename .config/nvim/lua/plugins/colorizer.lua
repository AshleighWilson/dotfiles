-- https://github.com/norcalli/nvim-colorizer.lua
PACKER.use {
    'norcalli/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup()
    end
}

