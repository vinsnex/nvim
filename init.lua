require('basic')
require('keybindings')
require('plugins')

-- vim.lsp.set_log_level('info')
--" Plugin config
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
require('plugin-config.telescope')
require('plugin-config.nvim-autopairs')
require('plugin-config.comment')
require('plugin-config.vsnip')
require('plugin-config.lualine')
require('plugin-config.toggleterm')
require('plugin-config.ctags')
require('plugin-config.nvim-treesitter')
require('plugin-config.nightfox')
require('plugin-config.registers')
require('plugin-config.symbols-outline')



-- lsp config
require('lsp/setup')
require('lsp/nvim-cmp')

require("colorscheme")


