return function()
--    vim.cmd([[packadd guihua.lua]])

    local custom_attach = function(client, bufnr)
        -- vim.cmd([[packadd lsp_signature.nvim]])
        require('lsp_signature').on_attach({
            bind = true,
            use_lspsaga = false,
            floating_window = true,
            fix_pos = true,
            hint_enable = true,
            hi_parameter = "Search",
            handler_opts = { "double" },
        })

        -- vim.cmd([[packadd aerial.nvim]])
        -- require('aerial').on_attach(client, bufnr)

        -- vim.cmd([[packadd vim-illuminate]])
        require('illuminate').on_attach(client)

        -- vim.cmd([[packadd cmp-nvim-lsp]])
    end

    require("navigator").setup({
        debug = false, -- log output
        width = 0.72, -- valeu of cols
        height = 0.40, -- listview height
        preview_height = 0.58,
        preview_lines = 70, -- total lines in preview screen
        preview_lines_before = 5, -- lines before the highlight line
        default_mapping = true,
        keymaps = {
            {
                key = 'gr',
                func = require('navigator.reference').async_ref,
                desc = 'async_ref',
            },
            {
                key = '<Leader>gr',
                func = require('navigator.reference').reference,
                desc = 'reference',
            },
            {
                mode = 'i',
                key = '<C-k>',
                func = vim.lsp.buf.signature_help,
                desc = 'signature_help',
            },
            {
                key = 'gk',
                func = vim.lsp.buf.signature_help,
                desc = 'signature_help',
            },
            {
                key = 'g0',
                func = require('navigator.symbols').document_symbols,
                desc = 'document_symbols',
            },
            {
                key = 'gW',
                func = require('navigator.workspace').workspace_symbol_live,
                desc = 'workspace_symbol_live',
            },
            {
                key = 'gd',
                func = require('navigator.definition').definition,
                desc = 'definition',
            },
            {
                key = 'gD',
                func = function() vim.lsp.buf.declaration({ border = 'rounded', max_width = 80 }) end,
                desc = 'declaration',
            },
            {
                key = 'gp',
                func = require('navigator.definition').definition_preview,
                desc = 'definition_preview',
            },
            {
                key = '<Leader>gt',
                func = require('navigator.treesitter').buf_ts,
                desc = 'buf_ts',
            },
            {
                key = '<Leader>gT',
                func = require('navigator.treesitter').bufs_ts,
                desc = 'bufs_ts',
            },
            -- { key = '<Leader>ct', func = require('navigator.ctags').ctags, desc = 'ctags' },
            {
                key = 'K',
                func = function() vim.lsp.buf.hover({ popup_opts = { border = 'single', max_width = 80 }}) end,
                desc = 'hover',
            },
            {
                mode = 'n',
                key = '<Leader>ga',
                func = require('navigator.codeAction').code_action,
                desc = 'code_action',
            },
            {
                mode = 'v',
                key = '<Leader>gA',
                func = vim.lsp.buf.range_code_action,
                desc = 'range_code_action',
            },
            {
                key = '<Leader>gn',
                func = require('navigator.rename').rename,
                desc = 'rename',
            },
            {
                key = '<Leader>gi',
                func = vim.lsp.buf.incoming_calls,
                desc = 'incoming_calls',
            },
            {
                key = '<Leader>go',
                func = vim.lsp.buf.outgoing_calls,
                desc = 'outgoing_calls',
            },
            {
                key = 'gi',
                func = vim.lsp.buf.implementation,
                desc = 'implementation',
            },
            {
                key = '<Space>D',
                func = vim.lsp.buf.type_definition,
                desc = 'type_definition',
            },
            {
                key = 'gL',
                func = require('navigator.diagnostics').show_diagnostics,
                desc = 'show_diagnostics',
            },
            {
                key = 'gG',
                func = require('navigator.diagnostics').show_buf_diagnostics,
                desc = 'show_buf_diagnostics',
            },
            {
                key = '<Leader>dt',
                func = require('navigator.diagnostics').toggle_diagnostics,
                desc = 'toggle_diagnostics',
            },
            {
                key = ']d',
                func = function() vim.diagnostic.goto_next({ border = 'rounded', max_width = 80}) end,
                desc = 'next diagnostics',
            },
            {
                key = '[d',
                func = function() vim.diagnostic.goto_prev({ border = 'rounded', max_width = 80}) end,
                desc = 'prev diagnostics',
            },
            {
                key = ']O',
                func = vim.diagnostic.set_loclist,
                desc = 'diagnostics set loclist',
            },
            {
                key = ']r',
                func = require('navigator.treesitter').goto_next_usage,
                desc = 'goto_next_usage',
            },
            {
                key = '[r',
                func = require('navigator.treesitter').goto_previous_usage,
                desc = 'goto_previous_usage',
            },
            {
                key = '<C-LeftMouse>',
                func = vim.lsp.buf.definition,
                desc = 'definition',
            },
            {
                key = 'g<LeftMouse>',
                func = vim.lsp.buf.implementation,
                desc = 'implementation',
            },
            {
                key = '<Leader>k',
                func = require('navigator.dochighlight').hi_symbol,
                desc = 'hi_symbol',
            },
            {
                key = '<Space>wa',
                func = require('navigator.workspace').add_workspace_folder,
                desc = 'add_workspace_folder',
            },
            {
                key = '<Space>wr',
                func = require('navigator.workspace').remove_workspace_folder,
                desc = 'remove_workspace_folder',
            },
            {
                mode = 'n',
                key = '<Space>ff',
                func = vim.lsp.buf.format,
                desc = 'format',
            },
            {
                mode = 'v',
                key = '<Space>ff',
                func = vim.lsp.buf.range_formatting,
                desc = 'range format',
            },
            {
                mode = 'n',
                key = '<Space>rf',
                func = require('navigator.formatting').range_format,
                desc = 'range_fmt_v'
            },
            {
                key = '<Space>wl',
                func = require('navigator.workspace').list_workspace_folders,
                desc = 'list_workspace_folders',
            },
            {
                mode = 'n',
                key = '<Space>la',
                func = require('navigator.codelens').run_action,
                desc = 'run code lens action',
            },
        },
        external = nil, -- true: enable for goneovim multigrid otherwise false

        border = 'single', -- border style, can be one of 'none', 'single', 'double', "shadow"
        lines_show_prompt = 10, -- when the result list items number more than lines_show_prompt,
        -- fuzzy finder prompt will be shown
        combined_attach = 'both', -- both: use both customized attach and navigator default attach, mine: only use my attach defined in vimrc
        on_attach = custom_attach, -- your on_attach will be called at end of navigator on_attach
        ts_fold = false,
        treesitter_analysis = true, -- treesitter variable context
        transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil to disable it
        lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
        -- setup here. if it is nil, navigator will not init signature help
        signature_help_cfg = { debug = false }, -- if you would like to init ray-x/lsp_signature plugin in navigator, pass in signature help
        lsp = {
            enable = true,
            code_action = {
                enable = true,
                sign = true,
                sign_priority = 40,
                virtual_text = false,
                virtual_text_icon = true,
            },
            code_lens_action = {
                enable = false,
                sign = true,
                sign_priority = 40,
                virtual_text = true,
                virtual_text_icon = true,
            },
            diagnostic = {
                underline = true,
                virtual_text = { spacing = 3, source = true }, -- show virtual for diagnostic message
                update_in_insert = false, -- update diagnostic message in insert mode
                severity_sort = { reverse = true },
            },
            format_on_save = false, -- set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
            disable_format_cap = {}, -- a list of lsp disable file format (e.g. if you using efm or vim-codeformat etc), empty by default
            disable_lsp = {
                "ccls",
                "jedi-language-server",
                "pylsp"
            }, -- a list of lsp server disabled for your project, e.g. denols and tsserver you may only want to enable one lsp server
            disply_diagnostic_qf = false, -- always show quickfix if there are diagnostic errors
            diagnostic_load_files = false, -- lsp diagnostic errors list may contains uri that not opened yet set to true
            -- to load those files
            diagnostic_virtual_text = true, -- show virtual for diagnostic message
            diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
            diagnostic_scrollbar_sign = { '▃', '▆', '█' }, -- set to nil to disable, set to {'╍', 'ﮆ'} to enable diagnostic status in scroll bar area
            servers = {}, -- you can add additional lsp server so navigator will load the default for you

            clangd = {
                cmd = {
                    'clangd',
                    '--background-index',
                    '-j=24',
                    '--inlay-hints',
                    '--completion-style=detailed',
                    '--pch-storage=memory',
                    '--header-insertion=never',
                    '--clang-tidy',
                    '--clang-tidy-checks=-*,llvm-*,clang-analyzer-*',
                    '--cross-file-rename',
                    '--limit-results=0',
                    '--limit-references=0',
                    '--enable-config',
                    '--index-file=clangd.dex',
                },
            },
        },
        icons = {
            icons = true, -- set to false to use system default ( if you using a terminal does not have nerd/icon)
            -- Code action
            code_action_icon = '', -- "",
            -- code lens
            code_lens_action_icon = '👓',
            -- Diagnostics
            diagnostic_head = '🐛',
            diagnostic_err = '📛',
            diagnostic_warn = '👎',
            diagnostic_info = [[👩]],
            diagnostic_hint = [[💁]],

            diagnostic_head_severity_1 = '🈲',
            diagnostic_head_severity_2 = '☣️',
            diagnostic_head_severity_3 = '👎',
            diagnostic_head_description = '👹',
            diagnostic_virtual_text = '🦊',
            diagnostic_file = '🚑',
            -- Values
            value_changed = '📝',
            value_definition = '🐶🍡', -- it is easier to see than 🦕
            -- Treesitter
            match_kinds = {
                var = ' ', -- "👹", -- Vampaire
                method = 'ƒ ', --  "🍔", -- mac
                ['function'] = ' ', -- "🤣", -- Fun
                parameter = '  ', -- Pi
                associated = '🤝',
                namespace = '🚀',
                type = ' ',
                field = '🏈',
            },
            treesitter_defult = '🌲',
        },
    })
end
