-- vim.o.background = "dark"

colorscheme = "nightfox"
-- zephyr

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme: " .. colorscheme .. " no install")
    return
end
