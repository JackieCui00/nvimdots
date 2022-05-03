local globals = require("core.globals")

local function bind_option(options)
	for k, v in pairs(options) do
		if v == true then
			vim.cmd("set " .. k)
		elseif v == false then
			vim.cmd("set no" .. k)
		else
			vim.cmd("set " .. k .. "=" .. v)
		end
	end
end

local function load_options()
	local basic = {
		number = true,
		smarttab = true,
		expandtab = true,
		tabstop = 4,
		shiftwidth = 4,
		scrolloff = 5,
		autowrite = true,
		wrap = true,
		-- autoread = true,

		fileformats = "unix,mac,dos",
		encoding = "utf-8",
		cursorline = true,
		cursorcolumn = true,
		listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
	}
	bind_option(basic)

	local view = {
		termguicolors = true,
	}
	bind_option(view)

	local cmd = {
		-- search
		incsearch = true,
		smartcase = true,
	}
	bind_option(cmd)

	local gui = {
	}
	bind_option(gui)

	local mouse = {
		-- enable mouse only in Insert/Command/prompt mode
		mouse = "icr"
	}
	bind_option(mouse)

	local misc = {
		history = 2000,
		undodir = globals.cache_dir .. "undo/",
		diffopt = "filler,iwhite,internal,algorithm:patience",
		jumpoptions = "stack",
	}
	bind_option(misc)

	if globals.is_mac then
		vim.g.clipboard = {
			name = "macOS-clipboard",
			copy = {["+"] = "pbcopy", ["="] = "pbcopy"},
			paste = {["+"] = "pbpaste", ["="] = "pbpaste"},
			cache_enabled = 0,
		}
		-- vim.g.python_host_prog = "/usr/bin/python"
		vim.g.python3_host_prog = "/usr/local/bin/pythons"
	end
end

load_options()
