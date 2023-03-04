return {
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = require("plugins.lsp.lspconfig"),
    },
    {
        -- to install language servers
        'williamboman/nvim-lsp-installer',
        lazy = false,
        config = require("plugins.lsp.lsp_installer"),
    },
    {
        -- show function signature when typing
        'ray-x/lsp_signature.nvim',
        lazy = false,
    },
    {
        -- symbols outline
        'stevearc/aerial.nvim',
        lazy = false,
        config = require("plugins.lsp.aerial"),
    },
    {
        -- symbols outline
        'preservim/tagbar',
        lazy = false,
        enabled = false,
        config = require("plugins.lsp.tagbar"),
    },
    {
        -- auto highlight current syntax-object
        'RRethy/vim-illuminate',
        lazy = false,
        config = require("plugins.lsp.illuminate"),
    },
    {
        -- simple collection of snippets
        'rafamadriz/friendly-snippets',
        lazy = false,
        dependencies = {
            {
                --  Snippet Engine for Neovim written in Lua.
                'L3MON4D3/LuaSnip',
                lazy = false,
                config = require("plugins.lsp.luasnip"),
            },
        },
    },
    {
        -- code completion
        'hrsh7th/nvim-cmp',
        lazy = false,
        dependencies = {
            'andersevenrud/cmp-tmux',
            'f3fora/cmp-spell',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'kdheepak/cmp-latex-symbols',
            'lukas-reineke/cmp-under-comparator',
            'saadparwaiz1/cmp_luasnip',
            -- 'tzachar/cmp-tabnine' {'do': './install.sh'}
        },
        config = require("plugins.lsp.nvim_cmp"),
    },
    {
        -- clangd enhancement
        'p00f/clangd_extensions.nvim',
        lazy = false,
        enabled = false,
        config = require("plugins.lsp.clangd_extensions"),
    },
    {
        -- show diagnose
        'folke/trouble.nvim',
        lazy = false,
        config = require("plugins.lsp.trouble"),
    },
    {
        -- Neovim plugin development
        'folke/neodev.nvim',
        lazy = false,
    },
    {
        -- better lsp navigator
        'ray-x/navigator.lua',
        lazy = false,
        dependencies = {
            {
                'ray-x/guihua.lua',
                build = 'cd lua/fzy && make',
            },
        },
        config = require("plugins.lsp.navigator"),
    },
}
