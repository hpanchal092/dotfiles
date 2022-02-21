-- autocomplete
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    mapping = {
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),

        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,

        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end
    },

    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "vsnip" },
        { name = "buffer", keyword_length = 5 },
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                path = "[path]",
                vsnip = "[snip]",
            })[entry.source.name]
            return vim_item
        end,
    },

    experimental = {
        native_menu = false,
        ghost_text = true
    },
})

