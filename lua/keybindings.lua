-- leader key
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

local opt = {
    noremap = true,
    silent = true,
}

local map = vim.api.nvim_set_keymap

-- Save File
map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>wq", ":wq!<CR>", opt)
map("n", "<leader>wqa", ":wqa!<CR>", opt)
map("n", "<leader>qq", ":wq!<CR>", opt)
map("n", "<leader>qa", ":wqa!<CR>", opt)


-- map("c", "<C-j>", "<C-n>", { noremap = false })
-- map("c", "<C-k>", "<C-p>", { noremap = false })

local map = vim.api.nvim_set_keymap

map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt) -- close others
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
map("n", "s=", "<C-w>=", opt)

map("n", "st", ":sp | terminal<CR>", opt)
map("n", "stv", ":vsp | terminal<CR>", opt)

-- nvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opt)
map('n', '<leader>ef', ':NvimTreeFindFileToggle<CR>', opt)


-- Telescope
map('n', '<leader>ff', ":Telescope find_files<CR>", opt)
map('n', '<leader>ef', ':NvimTreeFindFileToggle<CR>', opt)
map('n', '<leader>fg', ":Telescope live_grep grep_open_files=true<CR>", opt)
map('n', '<leader>fgg', ":Telescope live_grep<CR>", opt)
map('n', '<leader>fb', ":Telescope buffers<CR>", opt)
map('n', '<leader>ft', ":Telescope tags<CR>", opt)

-- ctag
map('n', '<leader>t', ':SymbolsOutline<CR>', opt)
map('n', 'g]', "<cmd>lua require('telescope').extensions.ctags_plus.jump_to_tag()<cr>", opt)

-- bufferline 左右Tab切换
map("n", "<A-,>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-.>", ":BufferLineCycleNext<CR>", opt)
map("n", "<A-d>", ":bd<CR>", opt)
map("n", "<A-<>", ":BufferLineMovePrev<CR>", opt)
map("n", "<A->>", ":BufferLineMoveNext<CR>", opt)
map("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", opt)
map("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", opt)
map("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", opt)
map("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", opt)
map("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", opt)
map("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", opt)
map("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", opt)
map("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", opt)
map("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", opt)
map("n", "<A-0>", ":BufferLineGoToBuffer 10<CR>", opt)
map("n", "<A-p>", ":BufferLineTogglePin<CR>", opt)

-- Replace
map("n", ":r", ":%s/", opt)

local pluginKeys = {}

-- nvim-cmp
pluginKeys.cmp = function(cmp)
    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end


    return {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<A-,>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs( -4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ["<C-l>"] = cmp.mapping(function(_)
            if vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
            if vim.fn["vsnip#jumpable"]( -1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
        -- super Tab
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),
    }
end


pluginKeys.mapLSP = function(mapbuf)
    -- mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
    mapbuf("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    -- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
    --mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)

    mapbuf("n", "<space>w", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opt)


    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
end

-- see ./lua/plugin-config/comment.lua
map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gcc", { noremap = false })
pluginKeys.comment = {
    -- Normal mode
    toggler = {
        line = "gcc",
        block = "gbc",
    },
    -- Visual mode
    opleader = {
        line = "gc",
        bock = "gb",
    },
}

return pluginKeys
