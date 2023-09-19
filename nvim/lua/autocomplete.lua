-- autocomplete
local cmp = require('cmp')
local luasnip = require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load()

vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-h>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })

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
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end
    },

    sources = {
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
            })[entry.source.name]
            return vim_item
        end,
    },

    experimental = {
        ghost_text = true
    },
})
