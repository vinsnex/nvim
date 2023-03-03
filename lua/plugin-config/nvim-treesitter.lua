require 'nvim-treesitter.configs'.setup {
    -- :TSInstallInfo
    ensure_installed = { "verilog", "python", "vim", "lua", "cmake", "c", "tsx" },
    auto_install = true,
    highlight = {
        enable = true,
        -- disable = { "verilog" },
        additional_vim_regex_highlighting = false
    },

    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>',
        }
    },

    indent = {
        enable = true
    }
}
-- Open Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldlevel = 1
