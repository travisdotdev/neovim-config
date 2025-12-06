-- Custom Keymaps
-- Place this file in ~/.config/nvim/lua/custom/keymaps.lua

-- ==============================================================================
-- GENERAL KEYMAPS
-- ==============================================================================

-- Quick save
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save file' })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- ==============================================================================
-- DIAGNOSTICS
-- ==============================================================================

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- ==============================================================================
-- TERMINAL MODE
-- ==============================================================================

-- Exit terminal mode with a shortcut
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- ==============================================================================
-- WINDOW NAVIGATION
-- ==============================================================================

-- Navigate between windows with CTRL+hjkl
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Equal window sizes
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = '[W]indow [=] equal size' })
-- Move windows around (rearrange layout)
vim.keymap.set('n', '<leader>wH', '<C-w>H', { desc = 'Move window far left' })
vim.keymap.set('n', '<leader>wJ', '<C-w>J', { desc = 'Move window far down' })
vim.keymap.set('n', '<leader>wK', '<C-w>K', { desc = 'Move window far up' })
vim.keymap.set('n', '<leader>wL', '<C-w>L', { desc = 'Move window far right' })
-- ==============================================================================
-- WINDOW RESIZING
-- ==============================================================================

-- Resize windows with arrow keys
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- ==============================================================================
-- BUFFER NAVIGATION
-- ==============================================================================

-- Navigate between buffers with Shift+hl
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })

-- ==============================================================================
-- TEXT MANIPULATION
-- ==============================================================================

-- Move lines up and down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv", { desc = 'Move line up' })

-- Better paste (doesn't lose your clipboard when pasting over selection)
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without losing clipboard' })

-- ==============================================================================
-- SCROLLING & SEARCHING
-- ==============================================================================

-- Keep cursor centered when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })

-- Keep cursor centered when searching
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })

-- ==============================================================================
-- FILE EXPLORER (Neo-tree)
-- ==============================================================================

-- Toggle and focus file explorer
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle file explorer' })
vim.keymap.set('n', '<leader>o', '<cmd>Neotree focus<cr>', { desc = 'Focus file explorer' })

-- ==============================================================================
-- DEBUGGER (DAP)
-- ==============================================================================

-- Basic debugging keymaps
vim.keymap.set('n', '<leader>db', '<cmd>DapToggleBreakpoint<cr>', { desc = 'Debug: Toggle breakpoint' })
vim.keymap.set('n', '<leader>dc', '<cmd>DapContinue<cr>', { desc = 'Debug: Continue' })
vim.keymap.set('n', '<leader>di', '<cmd>DapStepInto<cr>', { desc = 'Debug: Step into' })
vim.keymap.set('n', '<leader>do', '<cmd>DapStepOver<cr>', { desc = 'Debug: Step over' })
vim.keymap.set('n', '<leader>dO', '<cmd>DapStepOut<cr>', { desc = 'Debug: Step out' })
vim.keymap.set('n', '<leader>dt', '<cmd>DapTerminate<cr>', { desc = 'Debug: Terminate' })

-- H for start of line, L for end of line (very popular remap)
vim.keymap.set({ 'n', 'v' }, 'H', '^', { desc = 'Go to start of line' })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { desc = 'Go to end of line' })

-- Stay in visual mode when indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })
-- ==============================================================================
-- FILE OPERATIONS
-- ==============================================================================

-- Reverts file to saved state
vim.keymap.set('n', '<leader>fr', function()
    if vim.bo.modified then
        local choice = vim.fn.confirm('Discard all unsaved changes?', '&Yes\n&No', 2)
        if choice == 1 then
            vim.cmd 'e!'
        end
    else
        vim.notify 'No unsaved changes to revert'
    end
end, { desc = '[F]ile [R]evert to saved' })

-- Copy relative file path to clipboard
vim.keymap.set('n', '<leader>fy', function()
    local path = vim.fn.expand '%'
    vim.fn.setreg('+', path)
    vim.notify('Copied relative path: ' .. path)
end, { desc = '[F]ile path [Y]ank (relative)' })

-- Copy absolute file path to clipboard
vim.keymap.set('n', '<leader>fY', function()
    local path = vim.fn.expand '%:p'
    vim.fn.setreg('+', path)
    vim.notify('Copied absolute path: ' .. path)
end, { desc = '[F]ile path [Y]ank (absolute)' })

-- Copy just the filename (no path)
vim.keymap.set('n', '<leader>fn', function()
    local filename = vim.fn.expand '%:t'
    vim.fn.setreg('+', filename)
    vim.notify('Copied filename: ' .. filename)
end, { desc = '[F]ile [N]ame yank' })

-- Aggressive escape - closes everything (popups, telescope, etc)
vim.keymap.set('n', '<leader><Esc>', '<cmd>noh<cr><Esc>', { desc = 'Clear all and escape' })
-- ==============================================================================
-- UNIVERSAL ESCAPE WITH JK
-- ==============================================================================
-- Exit command mode with jk
vim.keymap.set('c', 'jk', '<C-c>', { desc = 'Exit command mode' })

-- Exit insert mode with jk
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })

-- Exit visual mode with jk
vim.keymap.set('v', 'jk', '<Esc>', { desc = 'Exit visual mode' })

-- Exit terminal mode with jk
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- ==============================================================================
-- CHEAT SHEET
-- ==============================================================================

-- Open your cheat sheet
vim.keymap.set('n', '<leader>?', function()
    vim.cmd 'e ~/.config/nvim/cheatsheet.md'
end, { desc = 'Open cheat sheet' })
-- Open dashboard
vim.keymap.set('n', '<leader>a', '<cmd>lua Snacks.dashboard()<cr>', { desc = 'Open d[A]shboard' })
-- Toggle showing hidden files in Telescope
vim.keymap.set('n', '<leader>sH', function()
    require('telescope.builtin').find_files { hidden = true }
end, { desc = '[S]earch files (include [H]idden)' })
