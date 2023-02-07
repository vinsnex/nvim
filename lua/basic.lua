vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.wo.number = true
vim.wo.relativenumber = true

vim.wo.cursorline = true
vim.wo.signcolumn = "yes"
--vim.wo.colorcolumn = "80"

-- Tab
local TAB_WIDTH = 4
vim.o.tabstop = TAB_WIDTH
vim.bo.tabstop = TAB_WIDTH
vim.o.softtabstop = TAB_WIDTH
vim.o.shiftround = true
vim.o.shiftwidth = TAB_WIDTH
vim.bo.shiftwidth = TAB_WIDTH

vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.showmode = false
vim.o.cmdheight = 1
vim.o.autoread = true
vim.bo.autoread = true
vim.o.wrap = false
vim.wo.wrap = false
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.hidden = true
vim.o.mouse = "a"
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.updatetime = 300
vim.o.timeoutlen = 300
vim.o.splitbelow = true
vim.o.splitright = true
vim.g.completeopt = "menu,menuone,noselect,noinsert"
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
vim.o.list = true
vim.o.listchars = "space: "
vim.o.wildmenu = true
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.pumheight = 10
vim.o.showtabline = TAB_WIDTH
-- python
vim.g.python_host_prog = "/home/vinsnex/.pyenv/versions/neovim2/bin/python"
vim.g.python3_host_prog = "/home/vinsnex/.pyenv/versions/neovim3/bin/python"

vim.api.nvim_command('autocmd BufWritePost,BufRead *.v,*.sv call system("ctags -R --exclude=build*")')
