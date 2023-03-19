return function()
    local bind = require("common.bindkey")
    bind.nvim_load_mapping({
        ["n|bp"]        = bind.map_cr("BufferLinePick"):with_noremap():with_silent(),
        ["n|<Leader>="] = bind.map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
        ["n|<Leader>-"] = bind.map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
        ["n|<Leader>+"] = bind.map_cr("BufferLineMoveNext"):with_noremap():with_silent(),
        ["n|<Leader>_"] = bind.map_cr("BufferLineMovePrev"):with_noremap():with_silent(),
        ["n|<Leader>be"] = bind.map_cr("BufferLineSortByExtension"):with_noremap(),
        ["n|<Leader>bd"] = bind.map_cr("BufferLineSortByDirectory"):with_noremap(),
        ["n|<Leader>1"] = bind.map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent(),
        ["n|<Leader>2"] = bind.map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent(),
        ["n|<Leader>3"] = bind.map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent(),
        ["n|<Leader>4"] = bind.map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent(),
        ["n|<Leader>5"] = bind.map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent(),
        ["n|<Leader>6"] = bind.map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent(),
        ["n|<Leader>7"] = bind.map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent(),
        ["n|<Leader>8"] = bind.map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent(),
        ["n|<Leader>9"] = bind.map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent(),
    })

    require("bufferline").setup({
        options = {
            mode = "buffers", -- set to "tabs" to only show tabpages instead
            number = "none",

            indicator = {
                -- icon = '👇',
                style = 'underline',
            },
            modified_icon = "✥",
            buffer_close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",

            max_name_length = 14,
            max_prefix_length = 13,
            tab_size = 20,
            show_buffer_close_icons = false,
            show_buffer_icons = true,
            show_tab_indicators = true,
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            separator_style = "thin",
            -- sort_by = 'insert_after_current', -- or 'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)

            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                    padding = 1,
                },
                {
                    filetype = "aerial",
                    text = "Symbol Outline",
                    text_align = "center",
                    padding = 1,
                },
            },
        },
    })
end
