-- options
vim.g.mapleader = " "
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.swapfile = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 5
vim.o.errorbells = false
vim.o.termguicolors = true
vim.o.showmode = false
vim.o.signcolumn = "yes:1"
vim.o.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum} "
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.confirm = true
vim.o.colorcolumn = "80"
vim.o.cursorline = true
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })

vim.fn.sign_define("DiagnosticSignError", { text = "", numhl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", numhl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", numhl = "DiagnosticSignHint" })

-- navigate splits
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { silent = true })
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { silent = true })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { silent = true })
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { silent = true })
