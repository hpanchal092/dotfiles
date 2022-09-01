return require('packer').startup(function()
    use {
        'lewis6991/impatient.nvim',
        config = function() require('impatient') end
    }
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-commentary'

    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end
    }

    use {
        'navarasu/onedark.nvim',
        config = function() require('plugs.onedark') end
    }

    use {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup() end
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = function() require('plugs.lualine') end
    }

    -- see config at lsp.lua
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- see config at autocomplete.lua
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use {
        'ray-x/lsp_signature.nvim',
        config = function() require('plugs.lsp_signature') end
    }

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    use {
        'ibhagwan/fzf-lua',
        config = function() require('plugs.fzf-lua') end
    }

    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('plugs.nvim-treesitter') end
    }
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end,
        config = function() require('plugs.firenvim') end
    }
    use 'andweeb/presence.nvim'
end)
