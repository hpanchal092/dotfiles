local get_hex = require('cokeline/utils').get_hex

require('cokeline').setup({
    default_hl = {
        fg = function(buffer)
            return
                buffer.is_focused
                and get_hex('Normal', 'fg')
                or get_hex('Conceal', 'fg')
        end,
        bg = function(buffer)
            return
                buffer.is_focused
                and get_hex('Normal', 'bg')
                or get_hex('Conceal', 'bg')
        end,
    },
    components = {
        {
            text = function(buffer) return buffer.is_focused and " " or " " end,
            fg = function(buffer) return buffer.is_focused and get_hex('Conceal', 'bg') end,
            bg = function(buffer) return buffer.is_focused and get_hex('Normal', 'bg') end,
        },
        {
            text = function(buffer) return buffer.unique_prefix end,
            fg = get_hex('Conceal', 'fg')
        },
        {
            text = function(buffer) return buffer.filename end,
            style = function(buffer) return buffer.is_focused and "bold" end,
        },
        {
            text = function(buffer) return buffer.is_modified and " [+]" or "" end,
        },
        {
            text = " ",
        },
        {
            text = function(buffer) return buffer.is_focused and "" or "" end,
            fg = function(buffer) return buffer.is_focused and get_hex('Normal', 'bg') end,
            bg = function(buffer) return buffer.is_focused and get_hex('Conceal', 'bg') end,
        }
    },
})

-- cycle through buffers
vim.keymap.set('n', '<leader>n', '<Plug>(cokeline-focus-next)', { silent = true })
vim.keymap.set('n', '<leader>p', '<Plug>(cokeline-focus-prev)', { silent = true })
vim.keymap.set('n', '<leader>q', '<cmd>bd<cr>', { silent = true })
