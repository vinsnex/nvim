return require('packer').startup(function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        use 'rcarriga/nvim-notify'

        -- gruvbox theme
        use {
            "ellisonleao/gruvbox.nvim",
            requires = { "rktjmp/lush.nvim" }
        }

        -- nord theme
        use 'shaunsingh/nord.nvim'

        -- zephyr theme
        use({
            'glepnir/zephyr-nvim',
            requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
        })

        -- nvim-tree
        use {
            'kyazdani42/nvim-tree.lua',
            requires = 'kyazdani42/nvim-web-devicons'
        }

        -- bufferline
        use {
            'akinsho/bufferline.nvim',
            requires = 'kyazdani42/nvim-web-devicons'
        }

        -- treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

        --  telescope
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.1',
            -- or                            , branch = '0.1.x',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }


        ------------- LSP -------------------
        use({
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            'neovim/nvim-lspconfig',
            'tamago324/nlsp-settings.nvim',
        })

        -- nvim-cmp
        use({
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',


        })

        -- vsnip
        use({
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'rafamadriz/friendly-snippets',
        })

        -- UI
        use 'onsails/lspkind-nvim'
        use({
            "glepnir/lspsaga.nvim",
            branch = "main",
            config = function()
                require("lspsaga").setup({})
            end,
            requires = { { "nvim-tree/nvim-web-devicons" } }
        })

        use "folke/neodev.nvim"
        use("b0o/schemastore.nvim")

        --------------------------------------------------------



        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }


        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        }

        use {
            'vim-airline/vim-airline',
            'vim-airline/vim-airline-themes'
        }

        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

        use "liuchengxu/vista.vim"

        use { "akinsho/toggleterm.nvim", tag = '*', config = function()
            require("toggleterm").setup()
        end }
    end)
