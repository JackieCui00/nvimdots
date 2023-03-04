return function()
    local db = require("dashboard")
    db.custom_header = {
        [[                                                                   ]],
        [[                                                                   ]],
        [[                                                                   ]],
        [[                                                                   ]],
        [[  _   _                           _____           _ _              ]],
        [[ | | | |                         /  __ \         | (_)             ]],
        [[ | |_| | __ _ _ __  _ __  _   _  | /  \/ ___   __| |_ _ __   __ _  ]],
        [[ |  _  |/ _` | '_ \| '_ \| | | | | |    / _ \ / _` | | '_ \ / _` | ]],
        [[ | | | | (_| | |_) | |_) | |_| | | \__/\ (_) | (_| | | | | | (_| | ]],
        [[ \_| |_/\__,_| .__/| .__/ \__, |  \____/\___/ \__,_|_|_| |_|\__, | ]],
        [[             | |   | |     __/ |                             __/ | ]],
        [[             |_|   |_|    |___/                             |___/  ]],
        [[                                                                   ]],
        [[                                                                   ]],
        [[                                                                   ]],
    }

    db.custom_center = {
        {
            icon = " ",
            desc = "Scheme change     ",
            shortcut = "<Leader> f c",
            action = "Telescope colorscheme",
        },
        {
            icon = " ",
            desc = "File frequency    ",
            shortcut= "<Leader> f r",
            action = "Telescope frecency",
        },
        {
            icon = " ",
            desc = "File history      ",
            shortcut = "<Leader> f e",
            action = "Telescope oldfiles",
        },
        {
            icon = " ",
            desc = "Project find      ",
            shortcut = "<Leader> f p",
            action = "Telescope project",
        },
        {
            icon = " ",
            desc = "File find         ",
            shortcut = "<Leader> f f",
            action = "Telescope find_files",
        },
        {
            icon = " ",
            desc = "File new          ",
            shortcut = "<Leader> f n",
            action = "DashboardNewFile",
        },
        {
            icon = " ",
            desc = "Word find         ",
            shortcut = "<Leader> f w",
            action = "Telescope live_grep",
        },
    }

    db.custom_footer = {
        [["🐬 Have Fun !!!!!!"]],
    }
end
