require('lualine').setup {
    options = {
        theme = 'onedark',
        icons_enabled = false,
        globalstatus = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                symbols = {
                    modified = ' [+]',
                    alternate_file = '',
                    directory = '',
                },
            }
        },
    },
}
