-- options
vim.g.mapleader = " "
vim.g.skip_ts_context_commentstring_module = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 5
vim.opt.errorbells = false
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes:1"
vim.opt.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum} "
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

vim.keymap.set("n", "<leader>e", "<cmd>enew<cr><cmd>Ex<cr>", { silent = true })
