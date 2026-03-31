return {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    dependencies = {
        'mfussenegger/nvim-dap',
    },
    config = function()
        -- Hardcode your venv path
        local venv_python = vim.fn.getcwd() .. '/venv/bin/python'

        -- Check if venv exists, otherwise fallback to Mason
        local python_path = vim.fn.executable(venv_python) == 1 and venv_python or
        vim.fn.stdpath 'data' .. '/mason/packages/debugpy/venv/bin/python'

        require('dap-python').setup(python_path)

        local dap = require 'dap'

        table.insert(dap.configurations.python, {
            type = 'python',
            request = 'launch',
            name = 'Debug All Tests (unittest discover)',
            module = 'unittest',
            args = { 'discover', '-s', 'src', '-v' },
            console = 'integratedTerminal',
            justMyCode = true,
            pythonPath = python_path, -- Use the same Python path
        })

        vim.keymap.set('n', '<leader>dt', function()
            -- Print which Python we're using (for debugging)
            print('Using Python: ' .. python_path)

            for _, config in ipairs(dap.configurations.python) do
                if config.name == 'Debug All Tests (unittest discover)' then
                    dap.run(config)
                    break
                end
            end
        end, { desc = 'Debug All Tests (test.sh equivalent)' })

        vim.keymap.set('n', '<leader>dpr', function()
            require('dap-python').test_method()
        end, { desc = 'Debug Python: Run test method' })

        vim.keymap.set('n', '<leader>dpc', function()
            require('dap-python').test_class()
        end, { desc = 'Debug Python: Run test class' })
    end,
}
