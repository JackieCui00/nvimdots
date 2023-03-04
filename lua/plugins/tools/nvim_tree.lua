return function()
    local bind = require("common.bindkey")
    bind.nvim_load_mapping({
        -- NvimTree
        ["n|<F4>"] = bind.map_cr("NvimTreeToggle"):with_noremap():with_silent(),
        ["n|<C-n>"] = bind.map_cr("NvimTreeToggle"):with_noremap():with_silent(),
        ["n|<Leader>nf"] = bind.map_cr("NvimTreeFindFile"):with_noremap():with_silent(),
        ["n|<Leader>nr"] = bind.map_cr("NvimTreeRefresh"):with_noremap():with_silent(),
    })

    require("nvim-tree").setup({
        -- netrw
        disable_netrw = true,
        hijack_netrw = true,

        auto_reload_on_write = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        ignore_buffer_on_setup = false,
        open_on_setup = false,
        open_on_setup_file = false,
        open_on_tab = false,
        sort_by = "name",
        update_cwd = false,
        view = {
            width = 30,
            side = "right",
            preserve_window_proportions = false,
            number = false,
            relativenumber = false,
            signcolumn = "yes",
            hide_root_folder = false,
        },
        renderer = {
            indent_markers = {
                enable = true,
                icons = {
                    corner = "└ ",
                    edge = "│ ",
                    none = "  ",
                },
            },
            icons = {
                padding = " ",
                symlink_arrow = "  ",
                glyphs = {
                    ["default"] = "", --
                    ["symlink"] = "",
                    ["git"] = {
                        ["unstaged"] = "",
                        ["staged"] = "", --
                        ["unmerged"] = "שׂ",
                        ["renamed"] = "", --
                        ["untracked"] = "ﲉ",
                        ["deleted"] = "",
                        ["ignored"] = "", --◌
                    },
                    ["folder"] = {
                        ['arrow_open'] = "",
                        ['arrow_closed'] = "",
                        -- ["arrow_open"] = "",
                        -- ["arrow_closed"] = "",
                        ["default"] = "",
                        ["open"] = "",
                        ["empty"] = "",
                        ["empty_open"] = "",
                        ["symlink"] = "",
                        ["symlink_open"] = "",
                    },
                },
            },
            root_folder_modifier = "ie",
        },
        hijack_directories = {
            enable = true,
            auto_open = true,
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {},
        },
        ignore_ft_on_setup = {},
        filters = {
            dotfiles = false,
            custom = { ".DS_Store", ".apsara", ".git"},
            exclude = {},
        },
        actions = {
            use_system_clipboard = true,
            change_dir = {
                enable = true,
                global = false,
            },
            open_file = {
                quit_on_open = false,
                resize_window = false,
                window_picker = {
                    enable = true,
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    exclude = {
                        filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                        buftype = { "nofile", "terminal", "help" },
                    },
                },
            },
        },
        respect_buf_cwd = true,
    })
end
