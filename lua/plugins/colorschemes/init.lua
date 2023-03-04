return {
    {
        'KeitaNakamura/neodark.vim',
        lazy = false,
    },
    {
        'crusoexia/vim-monokai',
        lazy = false,
    },
    {
        'acarapetis/vim-colors-github',
        lazy = false,
    },
    {
        'rakr/vim-one',
        lazy = false,
    },
    {
        'shaunsingh/nord.nvim',
        lazy = false,
        config = require("plugins.colorschemes.nord"),
    },
    {
        'sainnhe/edge',
        enabled = false,
        lazy = false,
        config = require("plugins.colorschemes.edge"),
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        config = require("plugins.colorschemes.catppuccin")
    }
}
