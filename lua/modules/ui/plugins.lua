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

--

return ui
