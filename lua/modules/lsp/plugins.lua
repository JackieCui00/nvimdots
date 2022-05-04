local lsp = {}
local conf = require("modules.lsp.config")

lsp["neovim/nvim-lspconfig"] = {
	opt = true,
	event = "BufReadPre",
	config = conf.nvim_lsp,
}
lsp["creativenull/efmls-configs-nvim"] = {
	opt = false,
	requires = "neovim/nvim-lspconfig",
}

-- to install language servers
lsp["williamboman/nvim-lsp-installer"] = {
	opt = true,
    cmd = {"LspInstall", "LspInstallInfo"},
	after = "nvim-lspconfig",
}

lsp["RishabhRD/popfix"] = {
    opt = false,
}
lsp["RishabhRD/nvim-lsputils"] = {
	opt = true,
	after = "nvim-lspconfig",
	config = conf.nvim_lsputils,
}

lsp["tami5/lspsaga.nvim"] = {
	opt = true,
	after = "nvim-lspconfig",
}
lsp["stevearc/aerial.nvim"] = {
	opt = true,
	after = "nvim-lspconfig",
	config = conf.aerial,
}
lsp["ray-x/lsp_signature.nvim"] = {
    opt = true,
    after = "nvim-lspconfig",
}
lsp["hrsh7th/nvim-cmp"] = {
	config = conf.cmp,
	event = "InsertEnter",
	requires = {
		{ "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
		{ "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
		{ "andersevenrud/cmp-tmux", after = "cmp-nvim-lua" },
		{ "hrsh7th/cmp-path", after = "cmp-tmux" },
		{ "f3fora/cmp-spell", after = "cmp-path" },
		{ "hrsh7th/cmp-buffer", after = "cmp-spell" },
		{ "kdheepak/cmp-latex-symbols", after = "cmp-buffer" },
		-- {
		--     'tzachar/cmp-tabnine',
		--     run = './install.sh',
		--     after = 'cmp-spell',
		--     config = conf.tabnine
		-- }
	},
}
lsp["L3MON4D3/LuaSnip"] = {
	after = "nvim-cmp",
	config = conf.luasnip,
	requires = "rafamadriz/friendly-snippets",
}

lsp["simrat39/symbols-outline.nvim"] = {
    opt = true,
    event = "BufRead",
    cmd = "SymbolsOutline",
    config = conf.symbols_outline,
}


return lsp
