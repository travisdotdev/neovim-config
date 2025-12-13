return {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
        require('toggleterm').setup {
            size = function(term)
                if term.direction == 'horizontal' then
                    return vim.o.lines * 0.33 -- Exactly 1/3 of screen
                elseif term.direction == 'vertical' then
                    return vim.o.columns * 0.4
                end
            end,
            direction = 'horizontal', -- Opens at bottom by default
            open_mapping = nil, -- Disable default <C-\> mapping
            shade_terminals = true,
            start_in_insert = false,
            persist_size = true,
            close_on_exit = true,

            -- Optional: Make float terminal look nice if you want to try it
            float_opts = {
                border = 'curved',
                width = math.floor(vim.o.columns * 0.9),
                height = math.floor(vim.o.lines * 0.9),
            },
        }

        -- Toggle terminal on/off
        vim.keymap.set({ 'n', 't' }, '<leader>tf', '<cmd>ToggleTerm<cr>', { desc = 'Toggle terminal' })

        -- Toggle terminal mode (insert/normal mode in terminal)
        vim.keymap.set('t', '<leader>tn', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

        -- -- Window navigation from terminal
        -- vim.keymap.set('t', '<leader>th', '<C-\\><C-n><C-w>h', { desc = 'Move to left window' })
        -- vim.keymap.set('t', '<leader>tj', '<C-\\><C-n><C-w>j', { desc = 'Move to below window' })
        -- vim.keymap.set('t', '<leader>tk', '<C-\\><C-n><C-w>k', { desc = 'Move to above window' })
        -- vim.keymap.set('t', '<leader>tl', '<C-\\><C-n><C-w>l', { desc = 'Move to right window' })

        -- Resize terminal height (increase/decrease)
        vim.keymap.set('t', '<leader>tp', '<C-\\><C-n>:resize +5<cr>i', { desc = 'Increase terminal height' })
        vim.keymap.set('t', '<leader>to', '<C-\\><C-n>:resize -5<cr>i', { desc = 'Decrease terminal height' })

        -- Also add these for normal mode (when you're in the terminal window but not in terminal mode)
        vim.keymap.set('n', '<leader>tp', ':resize +5<cr>', { desc = 'Increase window height' })
        vim.keymap.set('n', '<leader>to', ':resize -5<cr>', { desc = 'Decrease window height' })

        -- -- Optional: Floating terminal for variety
        -- vim.keymap.set('n', '<leader>tqo', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Floating terminal' })
    end,
}
