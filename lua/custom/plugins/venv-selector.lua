return {
    'linux-cultist/venv-selector.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'nvim-telescope/telescope.nvim',
        'mfussenegger/nvim-dap-python',
    },
    lazy = false,
    config = function()
        require('venv-selector').setup {
            name = {
                'venv',
                '.venv',
                'env',
                '.env',
            },
        }

        -- Keymaps
        vim.keymap.set('n', '<leader>vs', '<cmd>VenvSelect<cr>', { desc = 'Select Python venv' })
        vim.keymap.set('n', '<leader>vc', '<cmd>VenvSelectCached<cr>', { desc = 'Select cached venv' })
    end,
}
