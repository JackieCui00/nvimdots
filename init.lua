local globals = require("common.globals")
local log = require("common.log")

local createdir = function()
    local data_dir = {
        globals.cache_dir .. "backup",
        globals.cache_dir .. "session",
        globals.cache_dir .. "swap",
        globals.cache_dir .. "tags",
        globals.cache_dir .. "undo",
    }

    if vim.fn.isdirectory(globals.cache_dir) == 0 then
        log.debug("creating dir: %s", globals.cache_dir)
        os.execute("mkdir -p " .. globals.cache_dir)
        for _, v in pairs(data_dir) do
            if vim.fn.isdirectory(v) == 0 then
                log.debug("creating dir: %s", v)
                os.execute("mkdir -p " .. v)
            end
        end
    end
end

local disable_distribution_plugins = function()
    log.debug("disabling distribution plugins")
    vim.g.do_filetype_lua = true
    vim.g.did_load_filetypes = false
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
    log.debug("leader mapping")
    vim.g.mapleader = "\\"
    vim.api.nvim_set_keymap("n", " ", "", {noremap = true})
    vim.api.nvim_set_keymap("x", " ", "", {noremap = true})
end

-- Only for neovide
local neovide_config = function()
    log.debug("neovide config")
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

local init_plugins = function()
    log.info("init plugins")
    local lazypath = globals.plugin_dir .. globals.path_sep .. "lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        log.info("cloning lazy.nvim to ", lazypath)
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    local lazy_options = {
        root = globals.plugin_dir,
        git = {
          -- defaults for the `Lazy log` command
          -- log = { "-10" }, -- show the last 10 commits
          log = { "--since=3 days ago" }, -- show commits from the last 3 days
          timeout = 120, -- kill processes that take more than 2 minutes
          url_format = "https://github.com/%s.git",
          -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
          -- then set the below to false. This is should work, but is NOT supported and will
          -- increase downloads a lot.
          filter = true,
        },
        dev = {
            -- directory where you store your local plugin projects
            path = globals.local_plugin_dir,
            -- @type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
            patterns = {}, -- For example {"folke"}
            fallback = false, -- Fallback to git when local plugin doesn't exist
        },
        install = {
            -- install missing plugins on startup. This doesn't increase startup time.
            missing = true,
            -- try to load one of these colorschemes when starting an installation during startup
            colorscheme = { "habamax" },
        },
    }

    log.debug("setuping lazy")
    require("lazy").setup("plugins", lazy_options)
end

-- init
createdir()
disable_distribution_plugins()
leader_map()
-- neovide_config()

-- load basic options/keymaps/autocommands
require("basic")

-- load plugins
init_plugins()

vim.cmd([[colorscheme neodark]])
