require('basics')
require('misc')

-- install lazy if its not installed already
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

local lazy_opts = {
    ui = {
        icons = {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            source = "📄",
            start = "🚀",
            task = "📌",
        },
    },
}

-- plugins
require("lazy").setup({
    'nvim-lua/plenary.nvim',

    -- colorscheme
    {
        'navarasu/onedark.nvim',
        config = function() require('plugs.onedark') end,
        lazy = false,
        priority = 1000,
    },

    -- making the editor useable
    { 'numToStr/Comment.nvim', config = true },
    { 'nvim-lualine/lualine.nvim', config = function() require('plugs.lualine') end },
    { 'noib3/nvim-cokeline', config = function() require('plugs.cokeline') end },
    { 'windwp/nvim-autopairs', config = true },

    -- git
    { 'lewis6991/gitsigns.nvim', config = true },

    -- fuzzy finder
    { 'ibhagwan/fzf-lua', config = function() require('plugs.fzf-lua') end },

    -- lsp stuff
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function() require('lsp') end
    },
    { 'ray-x/lsp_signature.nvim', config = function() require('plugs.lsp_signature') end },

    -- autocomplete
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
        config = function() require('autocomplete') end
    },

    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function() require('plugs.nvim-treesitter') end,
        lazy = false,
        priority = 1000,
    },
    'JoosepAlviste/nvim-ts-context-commentstring',
    'windwp/nvim-ts-autotag',
    'RRethy/nvim-treesitter-endwise',
    'nvim-treesitter/playground',

    -- misc
    {
        'glacambre/firenvim',
        build = function() vim.fn['firenvim#install'](0) end,
        config = function() require('plugs.firenvim') end
    },
    { 'andweeb/presence.nvim', event = 'VeryLazy' },
    { 'ThePrimeagen/vim-be-good', event = 'VeryLazy' },
}, lazy_opts)
