return function()
    require("common.log").debug("colorschemes catppuccin is setuping")
    require("catppuccin").setup({
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15,
        },
        transparent_background = true,
        term_colors = false,
        compile = {
            enabled = false,
            path = vim.fn.stdpath "cache" .. "/catppuccin",
            suffix = "_compiled"
        },
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
            },
            coc_nvim = false,
            lsp_trouble = true,
            cmp = true,
            lsp_saga = false,
            gitgutter = false,
            gitsigns = true,
            telescope = true,
            nvimtree = {
                enabled = true,
                show_root = true,
                transparent_panel = false,
            },
            neotree = {
                enabled = false,
                show_root = true,
                transparent_panel = false,
            },
            dap = {
                enabled = false,
                enable_ui = false,
            },
            which_key = false,
            indent_blankline = {
                enabled = true,
                colored_indent_levels = false,
            },
            dashboard = true,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            bufferline = false,
            markdown = true,
            lightspeed = false,
            ts_rainbow = false,
            hop = false,
            notify = false,
            telekasten = false,
            symbols_outline = false,
            mini = false,
        }
    })
end
