local lspconfig = require("lspconfig")

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

local function install_lspserver(servers)
    local install_list = {}
    for name, config in pairs(servers) do
        table.insert(install_list, name)
    end

    require("mason-lspconfig").setup({
        ensure_installed = install_list
    })
end

local servers = {
    lua_ls = require("lsp.config.lua"),
    jsonls = require("lsp.config.json"),
    verible= require("lsp.config.verible"),
    svlangserver = require('lsp.config.svlangserver'),

}
-- svls = require("lsp.config.svls")

install_lspserver(servers)


for name, config in pairs(servers) do
    if config ~= nil and type(config) == "table" then
        config.on_setup(lspconfig[name])
    else
        lspconfig[name].setup({})
    end
end


