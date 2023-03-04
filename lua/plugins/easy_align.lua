_G.enhance_align = function(key)
	-- vim.cmd([[packadd vim-easy-align]])
	local map = { ["nga"] = "<Plug>(EasyAlign)", ["xga"] = "<Plug>(EasyAlign)" }
	return vim.api.nvim_replace_termcodes(map[key], true, true, true)
end

local bind = require("keymap.bind")
bind.nvim_load_mapping({
    ["n|ga"] = bind.map_cmd("v:lua.enhance_align('nga')"):with_expr(),
	["x|ga"] = bind.map_cmd("v:lua.enhance_align('xga')"):with_expr(),
})

return function()
    -- empty
end
