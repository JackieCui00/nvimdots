local config = {}

function config.edge()
    vim.cmd([[set background=dark]])
    vim.g.edge_style = "aura"
    vim.g.edge_enable_italic = 1
    vim.g.edge_disable_italic_comment = 1
    vim.g.edge_show_eob = 1
    vim.g.edge_better_performance = 1
    vim.g.edge_transparent_background = 1
end

function config.nord()
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_cursorline_transparent = true
    vim.g.nord_disable_background = false
    vim.g.nord_enable_sidebar_background = true
    vim.g.nord_italic = false
end

function config.catppuccin()
    require("catppuccin").setup({
        transparent_background = true,
        term_colors = true,
        styles = {
            comments = "italic",
            functions = "italic,bold",
            keywords = "italic",
            strings = "NONE",
            variables = "NONE",
        },
        integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = "italic",
                    hints = "italic",
                    warnings = "italic",
                    information = "italic",
                },
                underlines = {
                    errors = "underline",
                    hints = "underline",
                    warnings = "underline",
                    information = "underline",
                },
            },
            lsp_trouble = true,
            lsp_saga = true,
            gitgutter = false,
            gitsigns = true,
            telescope = true,
            nvimtree = {
                enabled = true,
                show_root = true,
            },
            which_key = true,
            indent_blankline = {
                enabled = true,
                colored_indent_levels = false,
            },
            dashboard = true,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            bufferline = true,
            markdown = true,
            lightspeed = false,
            ts_rainbow = true,
            hop = true,
        },
    })
end

function config.nvim_tree()
    vim.g.nvim_tree_root_folder_modifier = "ie"
    vim.g.nvim_tree_icon_padding = " "
    vim.g.nvim_tree_symlink_arror = "  "
    vim.g.nvim_tree_respect_buf_cwd = 1

    vim.g.nvim_tree_icons = {
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
    }

    require("nvim-tree").setup({
        auto_reload_on_write = true,
        disable_netrw = false,
        hijack_cursor = true,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        ignore_buffer_on_setup = false,
        open_on_setup = false,
        open_on_setup_file = false,
        open_on_tab = false,
        sort_by = "name",
        update_cwd = false,
        view = {
            width = 30,
            height = 30,
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
			custom = { ".DS_Store" },
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
    })
end

return config
