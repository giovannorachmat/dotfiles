return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' }
            },
            sections = {
                lualine_b = { 'branch', 'diff'},
                lualine_c = { 'filename' },
                lualine_x = { 'filetype' },
            },
        })
    end
}
