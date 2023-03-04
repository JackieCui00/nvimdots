_G.enhance_ft_move = function(key)
	local map = {
		f = "<Plug>(eft-f)",
		F = "<Plug>(eft-F)",
		t = "<Plug>(eft-t)",
		T = "<Plug>(eft-T)",
		[";"] = "<Plug>(eft-repeat)",
	}
	return vim.api.nvim_replace_termcodes(map[key], true, true, true)
end

local bind = require("keymap.bind")
bind.nvim_load_mapping({
	["n|f"] = bind.map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
	["n|F"] = bind.map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
	["n|t"] = bind.map_cmd("v:lua.enhance_ft_move('t')"):with_expr(),
	["n|T"] = bind.map_cmd("v:lua.enhance_ft_move('T')"):with_expr(),
	["n|;"] = bind.map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
})

return function()
    -- empty
end
