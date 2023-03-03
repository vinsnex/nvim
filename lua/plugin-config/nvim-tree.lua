vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    view = {
        width = 30,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    update_focused_file = {
        enable = true,
        update_root = true
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})
