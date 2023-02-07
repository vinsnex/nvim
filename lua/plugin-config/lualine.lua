local custom_gruvbox = require 'lualine.themes.powerline'

-- Change the background of lualine_c section for normal mode

require('lualine').setup {
    options = {
        theme = custom_gruvbox,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
    },
}
