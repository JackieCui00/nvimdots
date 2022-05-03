local ui = {}
local conf = require("modules.ui.config")

-- colorschemes
ui["KeitaNakamura/neodark.vim"] = {
    opt = false,
}
ui["crusoexia/vim-monokai"] = {
    opt = false,
}
ui["acarapetis/vim-colors-github"] = {
    opt = false,
}
ui["rakr/vim-one"] = {
    opt = false,
}
ui["shaunsingh/nord.nvim"] = {
    opt = false,
    config = conf.nord,
}
ui["sainnhe/edge"] = {
    opt = false,
    config = conf.edge,
}
ui["catppuccin/nvim"] = {
	opt = false,
	as = "catppuccin",
	config = conf.catppuccin,
}

-- icons
ui["kyazdani42/nvim-web-devicons"] = {
    opt = false,
}

-- file browser
ui["kyazdani42/nvim-tree.lua"] = {
    opt = true,
    cmd = {"NvimTreeToggle"},
    config = conf.nvim_tree,
}

-- dashboard when entering nvim
ui["glepnir/dashboard-nvim"] = {
    opt = true,
    event = "BufWinEnter",
}

-- show git signs when git-tracked files is modified
ui["lewis6991/gitsigns.nvim"] = {
	opt = true,
	event = {
        "BufRead",
        "BufNewFile",
    },
	config = conf.gitsigns,
	requires = {
        "nvim-lua/plenary.nvim",
        opt = true
    },
}

-- show all the buffers in the top of the screen
ui["akinsho/bufferline.nvim"] = {
    opt = true,
    tag = "*",
    event = "BufRead",
    config = conf.nvim_bufferline,
}

-- a brief line in the right side to show Search/Diagnose positions
ui["petertriho/nvim-scrollbar"] = {
    opt = true,
    event = "BufRead",
    config = conf.nvim_scrollbar,
}

-- visualize edit history
ui["mbbill/undotree"] = {
    opt = true,
    cmd = "UndotreeToggle",
}

-- show indent levels
ui["lukas-reineke/indent-blankline.nvim"] = {
    opt = true,
    event = "BufRead",
    config = conf.indent_blankline,
}

-- show syntax position in status line
ui["SmiteshP/nvim-gps"] = {
    opt = true,
    after = "nvim-treesitter",
    config = conf.nvim_gps,
}

-- pretty status line
ui["hoob3rt/lualine.nvim"] = {
	opt = true,
	after = "lualine-lsp-progress",
	config = conf.lualine,
}
ui["arkav/lualine-lsp-progress"] = {
    opt = true,
    after = "nvim-gps",
}

return ui
