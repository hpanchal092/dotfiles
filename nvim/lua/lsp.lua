-- language server installer
require("mason").setup()

require("mason-lspconfig").setup()
local servers = {
    clangd = {},
    gopls = {},
    pylsp = {},
    rust_analyzer = {},
    tsserver = {},
    jdtls = {},

    sumneko_lua = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
                globals = { 'vim' },
            }
        },
    },
}

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
})

-- keybindings
local function on_attach(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>FzfLua lsp_references<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

require('lspconfig')['clangd'].setup({ on_attach = on_attach })
require('lspconfig')['cssls'].setup({ on_attach = on_attach })
require('lspconfig')['eslint'].setup({ on_attach = on_attach })
require('lspconfig')['gopls'].setup({ on_attach = on_attach })
require('lspconfig')['html'].setup({ on_attach = on_attach })
require('lspconfig')['jdtls'].setup({ on_attach = on_attach })
require('lspconfig')['jsonls'].setup({ on_attach = on_attach })
require('lspconfig')['pylsp'].setup({ on_attach = on_attach })
require('lspconfig')['rust_analyzer'].setup({ on_attach = on_attach })
require('lspconfig')['sumneko_lua'].setup({ on_attach = on_attach })
require('lspconfig')['texlab'].setup({ on_attach = on_attach })
require('lspconfig')['tsserver'].setup({ on_attach = on_attach })
require('lspconfig')['vimls'].setup({ on_attach = on_attach })
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup {}
    -- end
}
