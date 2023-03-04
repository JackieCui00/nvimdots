return {
    {
        -- dashboard when entering nvim
        'glepnir/dashboard-nvim',
        lazy = true,
        event = "VimEnter",
        config = require("plugins.ui.dashboard"),
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
     {
         -- git-related, including: signs/history/pull/push
         'lewis6991/gitsigns.nvim',
         lazy = true,
         event = "BufEnter",
         config = require("plugins.ui.gitsigns"),
     },
     {
         -- show all the buffers in the top of the screen
         'akinsho/bufferline.nvim',
         lazy = true,
         event = "BufEnter",
         config = require("plugins.ui.bufferline"),
         dependencies = {
            "nvim-tree/nvim-web-devicons",
         },
     },
     {
         -- a brief line in the right side to show Search/Diagnose positions
         'petertriho/nvim-scrollbar',
         lazy = true,
         event = "BufEnter",
         config = require("plugins.ui.scrollbar"),
     },
     {
         -- show indent levels
         'lukas-reineke/indent-blankline.nvim',
         lazy = true,
         event = "BufEnter",
         config = require("plugins.ui.indent_blankline"),
     },
     {
         -- show syntax position in status line
         'SmiteshP/nvim-gps',
         lazy = false,
         config = require("plugins.ui.nvim_gps"),
     },
     {
         -- show ls indexing progress
         'arkav/lualine-lsp-progress',
         lazy = false,
         priority = 1,
     },
     {
         -- pretty status line
         'hoob3rt/lualine.nvim',
         lazy = false,
         priority = 10,
         config = require("plugins.ui.lualine"),
     }
}
