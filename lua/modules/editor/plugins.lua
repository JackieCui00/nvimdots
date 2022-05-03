local editor = {}
local conf = require("modules.editor.config")

-- ast parser
editor["nvim-treesitter/nvim-treesitter"] = {
	opt = true,
	run = ":TSUpdate",
	event = "BufRead",
	config = conf.nvim_treesitter,
}

return editor
