local nvim_lsp = require('lspconfig')
local nlspsettings = require('nlspsettings')

local opts = {
    on_attach = function(client, bufnr)
        -- local function buf_set_keymap(...)
        --     vim.api.nvim_buf_set_keymap(bufnr, ...)
        -- end
        --
        -- -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        -- require("keybindings").mapLSP(buf_set_keymap)
    end,
}


return {
    on_setup = function(server)
        server.setup(opts)
    end,
}
