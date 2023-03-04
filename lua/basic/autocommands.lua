local autocmd = {}

function autocmd.create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command("augroup " .. group_name)
        vim.api.nvim_command("autocmd!")
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten({"autocmd", def}), " ")
            -- log.debug(command)
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command("augroup END")
    end
end

function autocmd.load_autocmds()
    local definitions = {
        packer = {},
        sys = {
        },
        bufs = {
            -- Reload vim config automatically
            {
                "BufWritePost",
                [[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]],
            },

            { "BufWritePre", "/tmp/*", "setlocal noundofile" },
            { "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
            { "BufWritePre", "MERGE_MSG", "setlocal noundofile" },
            { "BufWritePre", "*.tmp", "setlocal noundofile" },
            { "BufWritePre", "*.bak", "setlocal noundofile" },

            -- highlight trailing spaces
            {"ColorScheme", "*.c,*.cpp,*.py,*.lua,*.go,*.vim,*.sh", [[highlight ExtraWhitespace ctermbg=red guibg=red]]},
            {"InsertEnter", "*",  [[match ExtraWhitespace /\s\+\%#\@<!$/]]},
            {"InsertLeave", "*", [[match ExtraWhitespace /\s\+$/]]},
            {"BufEnter", "*", [[match ExtraWhitespace /\s\+$/]]},

            -- auto place to last edit
            {
                "BufReadPost",
                "*",
                [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif]],
            },
            {
                "BufEnter",
                "*",
                [[++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]],
            },
        },
        wins = {
            -- Highlight current line only on focused window
            {
                "WinEnter,BufEnter,InsertLeave",
                "*",
                [[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]],
            },
            {
                "WinLeave,BufLeave,InsertEnter",
                "*",
                [[if &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal nocursorline | endif]],
            },
            -- Force write shada on leaving nvim
            {
                "VimLeave",
                "*",
                [[if has('nvim') | wshada! | else | wviminfo! | endif]],
            },
            -- Check if file changed when its window is focus, more eager than 'autoread'
            { "FocusGained", "* checktime" },
            -- Equalize window dimensions when resizing vim window
            { "VimResized", "*", [[tabdo wincmd =]] },
        },
        ft = {
            { "FileType", "markdown", "set wrap" },
            { "FileType", "make", "set noexpandtab shiftwidth=4 softtabstop=0" },
            -- Google tab style
            { "FileType", "c,cpp", "set expandtab tabstop=4 shiftwidth=4" },
            { "FileType", "dap-repl", "lua require('dap.ext.autocompl').attach()" },
            {
                "FileType",
                "dashboard",
                "set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2",
            },
            {
                "FileType",
                "*",
                [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]],
            },
            -- {
            --     "FileType",
            --     "c,cpp",
            --     "nnoremap <leader>h :ClangdSwitchSourceHeaderVSplit<CR>",
            -- },
        },
        yank = {
            {
                "TextYankPost",
                "*",
                [[silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=300})]],
            },
        },
    }

    autocmd.create_augroups(definitions)
end

autocmd.load_autocmds()
