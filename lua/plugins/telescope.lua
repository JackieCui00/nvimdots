local bind = require("keymap.bind")
bind.nvim_load_mapping({
    ["n|<Leader>fp"] = bind.map_cu("lua require('telescope').extensions.project.project{}"):with_noremap():with_silent(),
    ["n|<Leader>fr"] = bind.map_cu("lua require('telescope').extensions.frecency.frecency{}"):with_noremap():with_silent(),
    ["n|<Leader>fe"] = bind.map_cu("Telescope oldfiles"):with_noremap():with_silent(),
    ["n|<Leader>ff"] = bind.map_cu("Telescope find_files"):with_noremap():with_silent(),
    ["n|<Leader>fc"] = bind.map_cu("Telescope colorscheme"):with_noremap():with_silent(),
    ["n|<Leader>fw"] = bind.map_cu("Telescope live_grep"):with_noremap():with_silent(),
    ["n|<Leader>fn"] = bind.map_cu("DashboardNewFile"):with_noremap():with_silent(),
    ["n|<Leader>fb"] = bind.map_cu("Telescope buffers"):with_noremap():with_silent(),
    ["n|<Leader>fg"] = bind.map_cu("Telescope git_files"):with_noremap():with_silent(),
    ["n|<Leader>fz"] = bind.map_cu("Telescope zoxide list"):with_noremap():with_silent(),
})

return function()
    -- vim.cmd([[packadd sqlite.lua]])
    -- vim.cmd([[packadd telescope-fzf-native.nvim]])
    -- vim.cmd([[packadd telescope-project.nvim]])
    -- vim.cmd([[packadd telescope-frecency.nvim]])
    -- vim.cmd([[packadd telescope-zoxide]])
    -- vim.cmd([[packadd telescope-emoji.nvim]])

    require("telescope").setup({
        defaults = {
            initial_mode = "insert",
            prompt_prefix = "  ",
            selection_caret = " ",
            entry_prefix = " ",
            scroll_strategy = "limit",
            results_title = false,
            borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
            layout_strategy = "horizontal",
            path_display = { "absolute" },
            file_ignore_patterns = {},
            layout_config = {
                prompt_position = "bottom",
                horizontal = {
                    preview_width = 0.5,
                },
            },
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
            frecency = {
                show_scores = true,
                show_unindexed = true,
                ignore_patterns = { "*.git/*", "*/tmp/*" },
            },
        },
    })

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("project")
    require("telescope").load_extension("zoxide")
    require("telescope").load_extension("frecency")
    require("telescope").load_extension("emoji")
end
