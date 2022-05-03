local editor = {}
local conf = require("modules.editor.config")

-- ast parser
editor["nvim-treesitter/nvim-treesitter"] = {
	opt = true,
	run = ":TSUpdate",
	event = "BufRead",
	config = conf.nvim_treesitter,
}
editor["nvim-treesitter/nvim-treesitter-textobjects"] = { -- syntax-aware text browse
	opt = true,
	after = "nvim-treesitter",
}
editor["p00f/nvim-ts-rainbow"] = { -- colorful parentheses
	opt = true,
	after = "nvim-treesitter",
	event = "BufRead",
}
editor["JoosepAlviste/nvim-ts-context-commentstring"] = { -- syntax-aware commentstring setting
    opt = true,
    after = "nvim-treesitter",
}
editor["mfussenegger/nvim-ts-hint-textobject"] = {
	opt = true,
	after = "nvim-treesitter",
}
editor["windwp/nvim-ts-autotag"] = { -- autotag/autorename html tags
    opt = true,
    after = "nvim-treesitter",
    ft = {"html", "xml"},
    config = conf.autotag,
}

-- extend % to match syntax objects
editor["andymass/vim-matchup"] = {
    opt = true,
    after = "nvim-treesitter",
	config = conf.matchup,
}

-- faster j/k
editor["rhysd/accelerated-jk"] = {
    opt = true,
    event = "BufReadPost",
}

-- smarter f/F/t/T
editor["hrsh7th/vim-eft"] = {
    opt = true,
    event = "BufReadPost"
}

-- auto highlight current syntax-object
editor["RRethy/vim-illuminate"] = {
    opt = true,
    event = "BufRead",
    config = conf.nvim_illuminate,
}

-- comment
editor["terrortylor/nvim-comment"] = {
    opt = false,
    config = conf.nvim_comment,
}

-- align text
editor["junegunn/vim-easy-align"] = {
    opt = true,
    cmd = "EasyAlign"
}

-- manage/toggle persist terminal windows
editor["akinsho/toggleterm.nvim"] = {
	opt = true,
	event = "BufRead",
	config = conf.toggleterm,
}

-- better highlighter
editor["norcalli/nvim-colorizer.lua"] = {
	opt = true,
	event = "BufRead",
	config = conf.nvim_colorizer,
}

-- more-friendly buffer delete
editor["famiu/bufdelete.nvim"] = {
	opt = true,
	cmd = { "Bdelete", "Bwipeout", "Bdelete!", "Bwipeout!" },
}

return editor
