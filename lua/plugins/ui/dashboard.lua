return function()
    require("dashboard").setup({
        theme = 'hyper',
        hide = {
            statusline = true,
            tabline = true,
            winbar = true,
        },
        config = {
            week_header = {
                enable = true,
            },
            packages = {
                enable = true,
            },
            project = {
                enable = true,
                limit = 8,
                -- icon = 'your icon',
                label = '',
                -- action = 'Telescope find_files cwd='
            },
            mru = {
                limit = 10,
                -- icon = 'your icon',
                -- label = '',
            },
            footer = {
                [["🐬 Have Fun Coding !!!!!!"]],
            },
            shortcut = {
                {
                    desc = ' Update',
                    group = '@property',
                    action = 'Lazy update',
                    key = 'u'
                },
                {
                    icon = ' ',
                    icon_hl = '@variable',
                    desc = 'Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                {
                    desc = ' Apps',
                    group = 'DiagnosticHint',
                    action = 'Telescope app',
                    key = 'a',
                },
                {
                    desc = ' dotfiles',
                    group = 'Number',
                    action = 'Telescope dotfiles',
                    key = 'd',
                },
            },
        },
    })
end
