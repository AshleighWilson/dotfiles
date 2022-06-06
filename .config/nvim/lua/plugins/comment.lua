-- https://github.com/numToStr/Comment.nvim
PACKER.use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

