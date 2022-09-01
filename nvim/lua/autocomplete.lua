-- autocomplete
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    preselect = cmp.PreselectMode.None,

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = {
        ['<C-SPACE>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-Y>'] = cmp.mapping.confirm({ select = true }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },

    sources = {
        -- { name = 'nvim_lsp_signature_help'},
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 5 },
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                buffer = "[BUF]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[API]",
                path = "[PATH]",
                luasnip = "[SNIP]",
                -- nvim_lsp_signature_help = "",
            })[entry.source.name]
            return vim_item
        end,
    },

    experimental = {
        ghost_text = true
    },
})
