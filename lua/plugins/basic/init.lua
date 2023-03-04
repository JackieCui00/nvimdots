return {
    {
        'nvim-lua/plenary.nvim',
        lazy = false,
        priority = 1000,
    },
    {
        'nvim-lua/popup.nvim',
        lazy = false,
        priority = 1000,
    },
    {
        -- " faster filetype.vim
        'nathom/filetype.nvim',
        lazy = false,
        config = require("plugins.basic.filetype")
    },
    {
        -- better highlighter
        'norcalli/nvim-colorizer.lua',
        lazy = false,
        config = require("plugins.basic.nvim_colorizer")
    },
    {
        -- faster j/k
        'rhysd/accelerated-jk',
        lazy = false,
        config = require("plugins.basic.accelerated_jk"),
    },
    {
        -- smarter f/F/t/T
        'hrsh7th/vim-eft',
        lazy = false,
        config = require("plugins.basic.vim_eft")
    },
}
