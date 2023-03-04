local globals = {}
local os_name = vim.loop.os_uname().sysname

function globals:load_variable()
    self.is_mac = os_name == "Darwin"
    self.is_linux = os_name == "Linux"
    self.is_windows = os_name == "Windows_NT"

    local path_sep = self.is_window and "\\" or "/"
    local home = self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")

    self.home = home
    self.binary_dir = vim.fn.stdpath("config") .. path_sep .. "binary"
    if self.is_linux then
        self.binary_dir = self.binary_dir .. path_sep .. "linux" .. path_sep
    elseif self.is_mac then
        self.binary_dir = self.binary_dir .. path_sep .. "macos" .. path_sep
    else
        require("core.log").fatal("Not support WINDOWS yet !!!!")
    end
    self.lua_dir = vim.fn.stdpath("config") .. path_sep .. "lua"
    self.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
    self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
end

globals:load_variable()

return globals
