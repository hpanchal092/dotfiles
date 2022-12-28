require('fzf-lua').setup({
    winopts = {
        border = false,
        hl = {
            normal = 'NormalFloat',
            border = 'FloatBoarder',
            help_normal = 'NormalFloat',
            help_border = 'FloatBoarder',
            title = 'FloatTitle'
        },
    },
    keymap = {
        fzf = {
            ["ctrl-u"] = 'preview-page-up',
            ["ctrl-d"] = 'preview-page-down',
        }
    },
})

vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { silent = true })
vim.keymap.set('n', '<C-P>', '<cmd>FzfLua files<CR>')
vim.keymap.set('n', '<C-F>', '<cmd>FzfLua live_grep<CR>')
vim.keymap.set('n', '<C-B>', '<cmd>FzfLua buffers<CR>')

require('fzf-lua').register_ui_select()
