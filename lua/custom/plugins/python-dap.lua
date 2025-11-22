return {
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    -- Update this path to where debugpy is installed
    -- Mason installs it at:
    local debugpy_path = vim.fn.stdpath 'data' .. '/mason/packages/debugpy/venv/bin/python'
    require('dap-python').setup(debugpy_path)

    -- Optional: Add key mappings for Python debugging
    vim.keymap.set('n', '<leader>dpr', function()
      require('dap-python').test_method()
    end, { desc = 'Debug Python: Run test method' })

    vim.keymap.set('n', '<leader>dpc', function()
      require('dap-python').test_class()
    end, { desc = 'Debug Python: Run test class' })
  end,
}
