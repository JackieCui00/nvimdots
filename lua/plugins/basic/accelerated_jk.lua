return function()
    _G.enhance_jk_move = function(key)
        local map = key == "j" and "<Plug>(accelerated_jk_gj)" or "<Plug>(accelerated_jk_gk)"
        return vim.api.nvim_replace_termcodes(map, true, true, true)
    end

    local bind = require("common.bindkey")
    bind.nvim_load_mapping({
        ["n|j"] = bind.map_cmd("v:lua.enhance_jk_move('j')"):with_silent():with_expr(),
        ["n|k"] = bind.map_cmd("v:lua.enhance_jk_move('k')"):with_silent():with_expr(),
    })
end
