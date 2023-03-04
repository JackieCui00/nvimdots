" Plugin Manager
call plug#begin('~/.config/nvim/pack/plugged/start/')

" Libraries
"==============================================================================
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'


" Colorschemes
"==============================================================================
Plug 'KeitaNakamura/neodark.vim'
Plug 'crusoexia/vim-monokai'
Plug 'acarapetis/vim-colors-github'
Plug 'rakr/vim-one'
Plug 'shaunsingh/nord.nvim'
Plug 'sainnhe/edge'
Plug 'catppuccin/nvim', {'as' : 'catppuccin'}


" UI
"==============================================================================

" icons
Plug 'kyazdani42/nvim-web-devicons'

" dashboard when entering nvim
Plug 'glepnir/dashboard-nvim'

" git-related, including: signs/history/pull/push
Plug 'lewis6991/gitsigns.nvim'

" show all the buffers in the top of the screen
Plug 'akinsho/bufferline.nvim'

" a brief line in the right side to show Search/Diagnose positions
Plug 'petertriho/nvim-scrollbar'

" show indent levels
Plug 'lukas-reineke/indent-blankline.nvim'

" show syntax position in status line
Plug 'SmiteshP/nvim-gps'

" show ls indexing progress
Plug 'arkav/lualine-lsp-progress'

" pretty status line
Plug 'hoob3rt/lualine.nvim'


" Editor Enhancements
"==============================================================================

" faster j/k
Plug 'rhysd/accelerated-jk'

" smarter f/F/t/T
Plug 'hrsh7th/vim-eft'

" better highlighter
Plug 'norcalli/nvim-colorizer.lua'

" faster filetype.vim
Plug 'nathom/filetype.nvim'


" Tools
"==============================================================================

Plug 'kyazdani42/nvim-tree.lua'

Plug 'mbbill/undotree'

" align text
Plug 'junegunn/vim-easy-align'

" manage/toggle persist terminal windows
Plug 'akinsho/toggleterm.nvim'

" more-friendly buffer delete
Plug 'famiu/bufdelete.nvim'

" highlight multiple words
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'

" completion in cmdline
Plug 'romgrk/fzy-lua-native'
Plug 'gelguy/wilder.nvim'

" show possible keymapping
Plug 'folke/which-key.nvim'


" TreeSitter
"==============================================================================
Plug 'nvim-treesitter/nvim-treesitter', {'do' : ':TSUpdate'}

" syntax-aware text browse
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" colorful parentheses
Plug 'p00f/nvim-ts-rainbow'

" syntax-aware commentstring setting
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'mfussenegger/nvim-ts-hint-textobject'

" autotag/autorename html tags
Plug 'windwp/nvim-ts-autotag'

" extend % to match syntax objects
Plug 'andymass/vim-matchup'


" Telescope
"==============================================================================
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do' : 'make'}
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'tami5/sqlite.lua'
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'jvgrootveld/telescope-zoxide'
Plug 'xiyaowong/telescope-emoji.nvim'


" Lsp
"==============================================================================
Plug 'neovim/nvim-lspconfig'

" to install language servers
Plug 'williamboman/nvim-lsp-installer'

" show function signature when typing
Plug 'ray-x/lsp_signature.nvim'

" symbols outline
Plug 'stevearc/aerial.nvim'
" Plug 'preservim/tagbar'

" auto highlight current syntax-object
Plug 'RRethy/vim-illuminate'

" Snippet Engine for Neovim written in Lua.
Plug 'rafamadriz/friendly-snippets'
Plug 'L3MON4D3/LuaSnip'

" code completion
Plug 'andersevenrud/cmp-tmux'
Plug 'f3fora/cmp-spell'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'kdheepak/cmp-latex-symbols'
Plug 'lukas-reineke/cmp-under-comparator'
Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'tzachar/cmp-tabnine' {'do': './install.sh'}
Plug 'hrsh7th/nvim-cmp'

" clangd enhancement
" Plug 'p00f/clangd_extensions.nvim'

" show diagnose
Plug 'folke/trouble.nvim'

Plug 'folke/neodev.nvim'

" better lsp navigator
Plug 'ray-x/guihua.lua', {'do' : 'cd lua/fzy && make' }
Plug 'JackieCui00/navigator.lua'

call plug#end()

set completeopt=menu,menuone,noselect

lua << EOF
    require("core")
EOF
