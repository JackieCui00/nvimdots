local all_plugins = {
    "colorschemes/catppuccin.lua",
    "colorschemes/edge.lua",
    "colorschemes/nord.lua",

    "accelerated_jk.lua",
    "aerial.lua",
    "autotag.lua",
    "bufferline.lua",
    -- "clangd_extensions.lua",
    "dashboard.lua",
    "easy_align.lua",
    "filetype.lua",
    "gitsigns.lua",
    "illuminate.lua",
    "indent_blankline.lua",
    "lsp_installer.lua",
    "lspconfig.lua",
    "lualine.lua",
    "luasnip.lua",
    "matchup.lua",
    "navigator.lua",
    "nvim_cmp.lua",
    "nvim_colorizer.lua",
    -- "nvim_comment.lua",
    "nvim_gps.lua",
    "nvim_tree.lua",
    "nvim_treesitter.lua",
    "scrollbar.lua",
    -- "tagbar.lua",
    "telescope.lua",
    "toggleterm.lua",
    "trouble.lua",
    "vim_eft.lua",
    "vim_mark.lua",
    "which_key.lua",
    "wilder.lua",
}

for _, s in pairs(all_plugins) do
    if string.len(s) <= 4 or string.sub(s, -4) == ".lua" then
        s = string.sub(s, 1, -5)
        s = string.gsub(s, "/", ".")

        local func = require("plugins." .. s)
        func()
    end
end
