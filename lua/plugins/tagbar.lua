local bind = require("keymap.bind")
bind.nvim_load_mapping({
    ["n|<F3>"] = bind.map_cr("TagbarToggle"):with_noremap():with_silent(),
})

return function()
    vim.g.tagbar_ctags_bin = require("core.globals").binary_dir .. 'ctags'
    vim.g.tagbar_left = 1
    vim.g.tagbar_vertical = 0
    vim.g.tagbar_width = 30
    vim.g.tagbar_sort = 0
    vim.g.tagbar_autoshowtag = 1
    vim.g.tagbar_show_visibility = 1
    vim.g.tagbar_scrolloff = 10
    vim.g.tagbar_highlight_follow_insert = 1
    vim.g.tagbar_highlight_method = 'nearest'
    vim.cmd("set ut=10") -- updatetime in ms
end
