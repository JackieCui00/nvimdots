return function()
    local gps = require("nvim-gps")

    local function gps_content()
        if gps.is_available() then
            return gps.get_location()
        else
            return ""
        end
    end
    local mini_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    }
    local minimap = {
        sections = mini_sections,
        filetypes = { "minimap" },
    }
    local aerial = {
        sections = mini_sections,
        filetypes = { "aerial" },
    }

    local progress = function()
        return [[%3p%% of %L]]
    end

    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = "catppuccin",
            disabled_filetypes = {},
            component_separators = "|",
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { { "branch" }, { "diff" } },
            lualine_c = {
                { "lsp_progress" },
                { gps_content, cond = gps.is_available },
            },
            lualine_x = {
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                    symbols = { error = " ", warn = " ", info = " " },
                },
                {
                    "filename",
                    file_status = true,      -- Displays file status (readonly status, modified status)
                    path = 1,                -- 0: Just the filename, 1: Relative path, 2: Absolute path
                    shorting_target = 40,    -- Shortens path to leave 40 spaces in the window for other components. (terrible name, any suggestions?)
                    symbols = {
                        modified = '[+]',      -- Text to show when the file is modified.
                        readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    },
                }
            },
            lualine_y = {
                {
                    "filetype",
                    "encoding",
                },
                {
                    "fileformat",
                    icons_enabled = true,
                    symbols = {
                        unix = "LF",
                        dos = "CRLF",
                        mac = "CR",
                    },
                },
            },
            lualine_z = { progress, "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {
            "quickfix",
            "nvim-tree",
            "toggleterm",
            "fugitive",
            minimap,
            aerial,
        },
    })
end
