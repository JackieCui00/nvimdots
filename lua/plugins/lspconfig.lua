local bind = require("keymap.bind")
bind.nvim_load_mapping({
    ["n|<Leader>gi"] = bind.map_cr("LspInfo"):with_noremap():with_silent():with_nowait(),
	["n|<Leader>gr"] = bind.map_cr("LspRestart"):with_noremap():with_silent():with_nowait(),
})

return function()
    require("plugins.lsp_installer")()
    vim.lsp.set_log_level(vim.log.levels.WARN)
end
