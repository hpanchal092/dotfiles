return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- see config at lsp.lua
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- see config at autocomplete.lua
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use {
        'tpope/vim-commentary',
        config = function()
            vim.api.nvim_set_keymap('n', '<C-_>', 'gcc', {})
            vim.api.nvim_set_keymap('v', '<C-_>', 'gc', {})
        end
    }

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

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('telescope').load_extension('fzy_native')
            vim.api.nvim_set_keymap('n', '<C-P>', '<cmd>Telescope find_files<cr>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<C-F>', '<cmd>Telescope live_grep<cr>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<C-B>', '<cmd>Telescope buffers<cr>', { noremap = true })
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
end)
