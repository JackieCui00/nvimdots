return {
    {
        'kyazdani42/nvim-tree.lua',
        lazy = false,
        config = require("plugins.tools.nvim_tree"),
    },
    {
        'mbbill/undotree',
        lazy = false,
    },
    {
        -- align text
        'junegunn/vim-easy-align',
        lazy = false,
        config = require("plugins.tools.easy_align"),
    },
    {
        -- manage/toggle persist terminal windows
        'akinsho/toggleterm.nvim',
        lazy = false,
        config = require("plugins.tools.toggleterm"),
    },
    {
        -- more-friendly buffer delete
        'famiu/bufdelete.nvim',
        lazy = false,
    },
    {
        -- highlight multiple words
        'inkarkat/vim-mark',
        lazy = false,
        dependencies = {
            'inkarkat/vim-ingo-library',
        },
        config = require("plugins.tools.vim_mark"),
    },
    {
        -- completion in cmdline
        'gelguy/wilder.nvim',
        lazy = false,
        dependencies = {
            'romgrk/fzy-lua-native',
        },
        config = require("plugins.tools.wilder"),
    },
    {
        -- show possible keymapping
        'folke/which-key.nvim',
        lazy = false,
        config = require("plugins.tools.which_key"),
    },
    {
        -- treesitter
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        dependencies = {
            -- syntax-aware text browse
            'nvim-treesitter/nvim-treesitter-textobjects',

            -- colorful parentheses
            'p00f/nvim-ts-rainbow',

            -- syntax-aware commentstring setting
            'JoosepAlviste/nvim-ts-context-commentstring',

            'mfussenegger/nvim-ts-hint-textobject',

            {
                -- autotag/autorename html tags
                'windwp/nvim-ts-autotag',
                config = require("plugins.tools.autotag"),
            },

            {
                -- extend % to match syntax objects
                'andymass/vim-matchup',
                config = require("plugins.tools.matchup"),
            },
        },
        config = require("plugins.tools.nvim_treesitter"),
    },
    {
        -- telescope
        'nvim-telescope/telescope.nvim',
        lazy = false,
        dependencies = {
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
            'nvim-telescope/telescope-project.nvim',
            'tami5/sqlite.lua',
            'nvim-telescope/telescope-frecency.nvim',
            'jvgrootveld/telescope-zoxide',
            'xiyaowong/telescope-emoji.nvim',
        },
        config = require("plugins.tools.telescope")
    },
}
