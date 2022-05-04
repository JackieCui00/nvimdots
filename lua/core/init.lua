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
		os.execute("mkdir -p " .. globals.cache_dir)
		for _, v in pairs(data_dir) do
			if vim.fn.isdirectory(v) == 0 then
				os.execute("mkdir -p " .. v)
			end
		end
	end
end

local disable_distribution_plugins = function()
--	vim.g.did_load_filetypes = 1
	vim.g.did_load_fzf = 1
	vim.g.did_load_gtags = 1
	vim.g.did_load_gzip = 1
	vim.g.did_load_tar = 1
	vim.g.did_load_tarPlugin = 1
	vim.g.did_load_zip = 1
	vim.g.did_load_zipPlugin = 1
	vim.g.did_load_getscript = 1
	vim.g.did_load_getscriptPlugin = 1
	vim.g.did_load_vimball = 1
	vim.g.did_load_vimballPlugin = 1
	vim.g.did_load_matchit = 1
	vim.g.did_load_matchparen = 1
	vim.g.did_load_2html_plugin = 1
	vim.g.did_load_logiPat = 1
	vim.g.did_load_rrhelper = 1
	vim.g.did_load_netrw = 1
	vim.g.did_load_netrwPlugin = 1
	vim.g.did_load_netrwSettings = 1
	vim.g.did_load_netrwFileHandlers = 1
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

local dashboard_config = function()
	vim.g.dashboard_footer_icon = "🐬 "
	vim.g.dashboard_default_executive = "telescope"

	vim.g.dashboard_custom_header = {
        [[                                                                   ]],
        [[                                                                   ]],
        [[                                                                   ]],
        [[                                                                   ]],
        [[  _   _                           _____           _ _              ]],
        [[ | | | |                         /  __ \         | (_)             ]],
        [[ | |_| | __ _ _ __  _ __  _   _  | /  \/ ___   __| |_ _ __   __ _  ]],
        [[ |  _  |/ _` | '_ \| '_ \| | | | | |    / _ \ / _` | | '_ \ / _` | ]],
        [[ | | | | (_| | |_) | |_) | |_| | | \__/\ (_) | (_| | | | | | (_| | ]],
        [[ \_| |_/\__,_| .__/| .__/ \__, |  \____/\___/ \__,_|_|_| |_|\__, | ]],
        [[             | |   | |     __/ |                             __/ | ]],
        [[             |_|   |_|    |___/                             |___/  ]],
        [[                                                                   ]],
        [[                                                                   ]],
        [[                                                                   ]],
	}

	vim.g.dashboard_custom_section = {
		change_colorscheme = {
			description = { " Scheme change              <Leader> s c" },
			command = "DashboardChangeColorscheme",
		},
		find_frecency = {
			description = { " File frecency              <Leader> f r" },
			command = "Telescope frecency",
		},
		find_history = {
			description = { " File history               <Leader> f e" },
			command = "DashboardFindHistory",
		},
		find_project = {
			description = { " Project find               <Leader> f p" },
			command = "Telescope project",
		},
		find_file = {
			description = { " File find                  <Leader> f f" },
			command = "DashboardFindFile",
		},
		file_new = {
			description = { " File new                   <Leader> f n" },
			command = "DashboardNewFile",
		},
		find_word = {
			description = { " Word find                  <Leader> f w" },
			command = "DashboardFindWord",
		},
	}
end

local load_core = function()
	local pack = require("core.pack")

	createdir()
	disable_distribution_plugins()
	leader_map()

	pack:ensure_plugins()

	neovide_config()
	dashboard_config()

	require("core.options")
	require("core.mapping")
	require("keymap")
	require("core.event")

	pack:load_compile()

	vim.cmd([[colorscheme catppuccin]])
end

load_core()
