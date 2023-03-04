return function()
    vim.api.nvim_command("set foldmethod=expr")
    vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
    vim.opt.runtimepath:append(require("common.globals").treesitter_dir)

    require("nvim-treesitter.configs").setup({
        parser_install_dir = require("common.globals").treesitter_dir,
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "lua",
            "go",
            "gomod",
            "json",
            "yaml",
            "latex",
            "make",
            "python",
            "rust",
            "html",
            "javascript",
            "typescript",
            "vue",
            "css",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true
        },
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]["] = "@function.outer",
                    ["]m"] = "@class.outer",
                },
                goto_next_end = {
                    ["]]"] = "@function.outer",
                    ["]M"] = "@class.outer",
                },
                goto_previous_start = {
                    ["[["] = "@function.outer",
                    ["[m"] = "@class.outer",
                },
                goto_previous_end = {
                    ["[]"] = "@function.outer",
                    ["[M"] = "@class.outer",
                },
            },
        },
        rainbow = {
            enable = true,
            extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
            max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
        },
        context_commentstring = { enable = true, enable_autocmd = false },
        matchup = { enable = true },
    })
end
