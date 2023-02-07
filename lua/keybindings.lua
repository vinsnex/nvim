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
map("n", "<leader>wq", ":wqa!<CR>", opt)
map("n", "<leader>qq", ":wq!<CR>", opt)
map("n", "<leader>qa", ":wqa!<CR>", opt)


-- map("c", "<C-j>", "<C-n>", { noremap = false })
-- map("c", "<C-k>", "<C-p>", { noremap = false })



-- 本地变量
local map = vim.api.nvim_set_keymap

map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others
-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- 比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
map("n", "s=", "<C-w>=", opt)

-- Terminal相关
map("n", "st", ":sp | terminal<CR>", opt)
map("n", "stv", ":vsp | terminal<CR>", opt)

-- nvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opt)

-- Vista
map('n', '<leader>t', ':Vista!!<CR>', opt)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- bufferline 左右Tab切换
map("n", "<A-,>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-.>", ":BufferLineCycleNext<CR>", opt)
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
    mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
    --mapbuf("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
    --mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)

    -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- see ./lua/plugin-config/comment.lua
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
