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
    -- vim.g.did_load_filetypes = 1
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

local load_core = function()
    createdir()
    disable_distribution_plugins()
    leader_map()

    neovide_config()

    require("core.options")
    require("keymap")
    require("event")
    require("plugins")

    vim.cmd([[colorscheme neodark]])

    require("vim.lsp.log").error("config done loading!!!")
end

load_core()