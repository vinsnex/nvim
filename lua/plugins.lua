return require('packer').startup(function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        use 'rcarriga/nvim-notify'
        use 'kyazdani42/nvim-web-devicons'

        --  theme
        use "EdenEast/nightfox.nvim"
        use 'glepnir/zephyr-nvim'

        use 'kyazdani42/nvim-tree.lua'
        use 'nvim-tree/nvim-web-devicons'
        use 'akinsho/bufferline.nvim'

        -- treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

        --  telescope
        use { 'nvim-telescope/telescope.nvim'}
        use 'nvim-lua/plenary.nvim'
        use 'gnfisher/nvim-telescope-ctags-plus'
        -- tags
        use 'simrat39/symbols-outline.nvim'

        ------------- LSP -------------------
        use "williamboman/mason.nvim"
        use "williamboman/mason-lspconfig.nvim"
        use 'neovim/nvim-lspconfig'
        use 'tamago324/nlsp-settings.nvim'

        -- nvim-cmp
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'

        -- vsnip
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/vim-vsnip'
        use 'rafamadriz/friendly-snippets'

        use 'onsails/lspkind-nvim'
        use "glepnir/lspsaga.nvim"

        use "folke/neodev.nvim"
        use("b0o/schemastore.nvim")

        use "windwp/nvim-autopairs"


        use 'numToStr/Comment.nvim'

        use 'vim-airline/vim-airline'
        use 'vim-airline/vim-airline-themes'
        use 'nvim-lualine/lualine.nvim'

        use "akinsho/toggleterm.nvim"


        use "p00f/nvim-ts-rainbow"
        use "tversteeg/registers.nvim"

    end)
