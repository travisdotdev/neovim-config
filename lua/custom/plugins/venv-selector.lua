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
            -- Your options here
            -- name = "venv", -- Change this if you use a different name for your venvs
            name = {
                'venv',
                '.venv',
                'env',
                '.env',
            },
            auto_refresh = true,
            search_venv_managers = true, -- Search for virtualenv/pyenv/conda/poetry
            search = true,
            search_workspace = true,

            -- Automatically activate venv when opening a Python file
            changed_venv_hooks = {
                -- Update LSP (Pyright) when venv changes
                function(venv_path, prev_venv_path)
                    local venv_python = venv_path .. '/bin/python'
                    require('lspconfig').pyright.setup {
                        settings = {
                            python = {
                                pythonPath = venv_python,
                            },
                        },
                    }
                end,
                -- Update DAP (debugger) when venv changes
                function(venv_path, prev_venv_path)
                    local venv_python = venv_path .. '/bin/python'
                    require('dap-python').resolve_python = function()
                        return venv_python
                    end
                end,
            },
        }

        -- Keymaps
        vim.keymap.set('n', '<leader>vs', '<cmd>VenvSelect<cr>', { desc = 'Select Python venv' })
        vim.keymap.set('n', '<leader>vc', '<cmd>VenvSelectCached<cr>', { desc = 'Select cached venv' })
    end,
}
