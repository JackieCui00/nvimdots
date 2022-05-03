local globals = {}
local os_name = vim.loop.os_uname().sysname

function globals:load_variable()
	self.is_mac = os_name == "Darwin"
	self.is_linux = os_name == "Linux"
	self.is_windows = os_name == "Windows_NT"

	local path_sep = self.is_window and "\\" or "/"
	local home = self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")

	self.home = home
	self.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
	self.lua_dir = vim.fn.stdpath("config") .. path_sep .. "lua"
	self.modules_dir = self.lua_dir .. path_sep .. "modules"
	self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
end

globals:load_variable()

return globals
