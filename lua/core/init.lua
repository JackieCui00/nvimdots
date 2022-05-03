local globals = require("core.globals")
local vim = vim

local createdir = function()
	local data_dir = {
		globals.cache_dir .. "backup",
		globals.cache_dir .. "session",
		globals.cache_dir .. "swap",
		globals.cache_dir .. "tags",
		globals.cache_dir .. "undo",
	}

	if vim.fn.isdirectory(globals.cache_dir) == 0 then
		os.execute("mkdir -p " .. global_cache_dir)
		for _, v in pair(data_dir) do
			if vim.fn.isdirectory(v) == 0 then
				os.execute("mkdir -p " .. v)
			end
		end
	end
end

local leader_map = function()
	vim.g.mapleader = "\\"
	vim.api.nvim_set_keymap("n", " ", "", {noremap = true})
	vim.api.nvim_set_keymap("x", " ", "", {noremap = true})
end

-- Only for neovide
local neovide_config = function()
	vim.cmd([[set guifont=JetBrainsMono\ Nerd\ Font:h12]])
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_no_idle = true
	vim.g.neovide_cursor_animation_length = 0.03
	vim.g.neovide_cursor_trail_length = 0.05
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_cursor_vfx_opacity = 200.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
	vim.g.neovide_cursor_vfx_particle_speed = 20.0
	vim.g.neovide_cursor_vfx_particle_density = 5.0
end

local load_core = function()
	local pack = require("core.pack")

	createdir()
	-- disable_distribution_plugins()
	leader_map()

	pack.ensure_plugins()

	neovide_config()
	-- dashboard_config()
	-- minimap_config()
	-- clipboard_config()

	require("core.options")
	require("core.mapping")
	--require("keymap")
	--require("core.event")

	pack.load_compile()

	vim.cmd([[colorscheme slate]])
end

load_core()
