return require('packer').startup(function()
    use {
        'lewis6991/impatient.nvim',
        config = function ()
            require('impatient')
        end
    }
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-commentary'

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    use {
        'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup { code_style = { comments = 'none' } }
            require('onedark').load()
        end
    }

    use {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'onedark',
                    icons_enabled = false,
                    globalstatus = true,
                }
            }
        end
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

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    use {
        'ibhagwan/fzf-lua',
        config = function()
            vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { silent = true })
            vim.keymap.set('n', '<C-P>', '<cmd>FzfLua files<CR>')
            vim.keymap.set('n', '<C-F>', '<cmd>FzfLua live_grep<CR>')
            vim.keymap.set('n', '<C-B>', '<cmd>FzfLua buffers<CR>')
            require('fzf-lua').register_ui_select()
        end
    }

    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                context_commentstring = {
                    enable = true
                },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true
                },
            }
        end
    }
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end,
        config = function()
            local fc = {}
            fc['.*'] = { selector = 'textarea', priority = 1, takeover = 'never' }
            vim.g.firenvim_config = { localSettings = fc }
        end
    }
    use 'andweeb/presence.nvim'
end)
