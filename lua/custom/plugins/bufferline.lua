-- Bufferline: VSCode-style buffer tabs at the top
return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    opts = {
        options = {
            mode = 'buffers',              -- set to "tabs" to only show tabpages instead
            themable = true,               -- allows highlight groups to be overriden i.e. sets highlights as default
            numbers = 'none',              -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
            close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
            right_mouse_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
            left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
            middle_mouse_command = nil,    -- can be a string | function, see "Mouse actions"
            -- buffer_close_icon = '󰅖',
            buffer_close_icon = '',
            -- buffer_close_icon = '✕',
            -- close_icon = '',
            path_components = 1, -- Show only the file name without the directory
            modified_icon = '●',
            left_trunc_marker = '',
            right_trunc_marker = '',
            max_name_length = 30,
            max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
            tab_size = 21,
            diagnostics = false,
            diagnostics_update_in_insert = false,
            color_icons = true,
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            separator_style = { '│', '│' }, -- | "thick" | "thin" | { 'any', 'any' },
            enforce_regular_tabs = true,
            always_show_bufferline = true,
            show_tab_indicators = false,
            indicator = {
                -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'none', -- Options: 'icon', 'underline', 'none'
            },
            icon_pinned = '󰐃',
            minimum_padding = 1,
            maximum_padding = 5,
            maximum_length = 15,
            sort_by = 'insert_at_end',
        },
        highlights = {
            separator = {
                fg = '#434C5E',
            },
            buffer_selected = {
                bold = true,
                italic = false,
            },
            -- separator_selected = {},
            -- tab_selected = {},
            -- background = {},
            -- indicator_selected = {},
            -- fill = {},
        },
    },
    config = function(_, opts)
        require('bufferline').setup(opts)

        -- Keymaps for buffer navigation (integrates with your existing Shift+h/l)
        vim.keymap.set('n', '<leader>bp', '<cmd>BufferLinePick<cr>', { desc = '[B]uffer [P]ick' })
        vim.keymap.set('n', '<leader>bc', '<cmd>BufferLinePickClose<cr>', { desc = '[B]uffer Pick [C]lose' })
        vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', { desc = '[B]uffer Close Left ([H])' })
        vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseRight<cr>', { desc = '[B]uffer Close Right ([L])' })

        -- Alternative buffer navigation
        vim.keymap.set('n', '<leader>[', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
        vim.keymap.set('n', '<leader>]', '<cmd>bnext<cr>', { desc = 'Next buffer' })

        -- Jump to specific buffer by number (Alt+1 through Alt+9)
        for i = 1, 9 do
            vim.keymap.set('n', '<A-' .. i .. '>', '<cmd>BufferLineGoToBuffer ' .. i .. '<cr>',
                { desc = 'Go to buffer ' .. i })
        end

        -- Add to keymaps.lua
        vim.keymap.set('n', '<Tab>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
        vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })

        -- Pin/unpin buffer
        vim.keymap.set('n', '<leader>bP', '<cmd>BufferLineTogglePin<cr>', { desc = '[B]uffer Toggle [P]in' })
    end,
}
