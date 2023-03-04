local log = require("core.log")
local globals = require("core.globals")

local is_mac = globals.is_mac
local lua_dir = globals.lua_dir
local data_dir = globals.data_dir

local packer_compiled = data_dir .. "lua/_compiled.lua"
local bak_compiled = data_dir .. "lua/bak_compiled.lua"

local packer = nil

local PackerMgr = {}

function PackerMgr:load_packer()
	if not packer then
		vim.api.nvim_command("packadd packer.nvim")
		packer = require("packer")
	end

	packer.init({
		compile_path = packer_compiled,
		git = {clone_timeout = 60, default_url_format = "git@github.com:%s"},
		disable_commands = true,
		display = {
			open_fn = function()
				return require("packer.util").float({border = "none"})
			end,
		},
        log = {
            level = "debug",
        },
	})

	packer.reset()

	local use = packer.use
	use({"wbthomason/packer.nvim", opt = false})

    for name, conf in pairs(require("plugins")) do
        local repo = vim.tbl_extend("force", {name}, conf)
        use(repo)
    end
end

function PackerMgr:init_ensure_plugins()
	local packer_dir = data_dir .. "pack/packer/start/packer.nvim"
	local state = vim.loop.fs_stat(packer_dir)
	if not state then
		local cmd = "!git clone git@github.com:wbthomason/packer.nvim.git " .. packer_dir
		vim.api.nvim_command(cmd)
		vim.loop.fs_mkdir(data_dir .. "lua", 511, function()
			assert("make compile path dir failed")
		end)

		self:load_packer()
		packer.install()
	end
end

local plugins = setmetatable({}, {
	__index = function(_, key)
		if not packer then
			PackerMgr:load_packer()
		end
		return packer[key]
	end,
})

function plugins:ensure_plugins()
	PackerMgr:init_ensure_plugins()
end

function plugins:back_compile()
	if vim.fn.filereadable(packer_compiled) == 1 then
		os.rename(packer_compiled, bak_compiled)
	end
	plugins.compile()
end

function plugins:load_compile()
	if vim.fn.filereadable(packer_compiled) == 1 then
		require("_compiled")
	else
		assert("Missing packer compile file. Run PackerCompile or PackerInstall to fix")
	end

	vim.cmd([[command! PackerCompile lua require('core.pack').back_compile()]])
	vim.cmd([[command! PackerInstall lua require('core.pack').install()]])
	vim.cmd([[command! PackerUpdate lua require('core.pack').update()]])
	vim.cmd([[command! PackerSync lua require('core.pack').sync()]])
	vim.cmd([[command! PackerClean lua require('core.pack').clean()]])
	vim.cmd([[command! PackerStatus lua require('core.pack').compile() require('packer').status()]])

	vim.cmd([[autocmd User PackerComplete lua require('core.pack').back_compile()]])

    PackerMgr:load_packer()
end

return plugins
