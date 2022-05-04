local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

require("keymap.config")

local plugin_map = {
    -- NvimTree
    ["n|<F4>"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),

    -- SymbolsOutline
    ["n|<F3>"] = map_cr("SymbolsOutline"):with_noremap():with_silent(),

}

bind.nvim_load_mapping(plugin_map)
