local bind = require("common.bindkey")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

local default_map = {
    -- Normal
    ["n|<C-s>"] = map_cu("write"):with_noremap(),
    ["n|n"] = map_cmd("nzzzv"):with_noremap(),
    ["n|N"] = map_cmd("Nzzzv"):with_noremap(),
    ["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap(),
    ["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap(),
    ["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap(),
    ["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap(),
    ["n|<Leader>f"] = map_cmd("<C-w>w"):with_noremap(), -- toggle between floating window
    ["n|<F2>"] = map_cr(":nohlsearch"):with_noremap():with_silent(),
    ["n|<Leader>["] = map_cr("vertical resize -5"):with_silent(),
    ["n|<Leader>]"] = map_cr("vertical resize +5"):with_silent(),
    ["n|<Leader>{"] = map_cr("resize -2"):with_silent(),
    ["n|<Leader>}"] = map_cr("resize +2"):with_silent(),
    ["n|<Leader>,"] = map_cr("bp"):with_noremap():with_silent(),
    ["n|<Leader>."] = map_cr("bn"):with_noremap():with_silent(),
    ["n|<Leader><"] = map_cr("tabprevious"):with_noremap():with_silent(),
    ["n|<Leader>>"] = map_cr("tabnext"):with_noremap():with_silent(),
    ["n|<Leader>d"] = map_cr("Bdelete"):with_noremap():with_silent(),
    ["n|K"] = map_cr("Man 2,3 <C-r><C-w>"):with_noremap():with_silent(), -- runtime ftplugin/man.vim

    -- Insert
    ["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap(),
    ["i|<C-b>"] = map_cmd("<Left>"):with_noremap(),
    ["i|<C-a>"] = map_cmd("<ESC>^i"):with_noremap(),
    ["i|<C-s>"] = map_cmd("<Esc>:w<CR>"),
    ["i|<C-q>"] = map_cmd("<Esc>:wq<CR>"),
    ["i|jk"] = map_cmd("<Esc>"),

    -- command line
    ["c|<C-b>"] = map_cmd("<Left>"):with_noremap(),
    ["c|<C-f>"] = map_cmd("<Right>"):with_noremap(),
    ["c|<C-a>"] = map_cmd("<Home>"):with_noremap(),
    ["c|<C-e>"] = map_cmd("<End>"):with_noremap(),
    ["c|<C-d>"] = map_cmd("<Del>"):with_noremap(),
    ["c|<C-h>"] = map_cmd("<BS>"):with_noremap(),
    ["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
    ["c|w!!"] = map_cmd("execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"),

    -- Visual
    ["v|J"] = map_cmd(":m '>+1<cr>gv=gv"),
    ["v|K"] = map_cmd(":m '<-2<cr>gv=gv"),
    ["v|<"] = map_cmd("<gv"),
    ["v|>"] = map_cmd(">gv"),

    -- Terminal
    ["t|<C-t>"] = map_cmd([[<C-\><C-n>]]):with_noremap()
}

bind.nvim_load_mapping(default_map)
