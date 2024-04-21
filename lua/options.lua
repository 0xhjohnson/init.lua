vim.opt.mouse = ""

vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.opt.updatetime = 250

vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
vim.opt.wrap = false

-- Hide banner
vim.g.netrw_banner = 0
-- Tree style view
vim.g.netrw_liststyle = 3
-- Hide based on .gitignore
vim.g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]]
-- Open with right split
vim.g.netrw_altv = 1
