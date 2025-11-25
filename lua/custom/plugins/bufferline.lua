-- Bufferline: VSCode-style buffer tabs at the top
return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    opts = {
        options = {
            mode = 'buffers',        -- set to "tabs" to only show tabpages instead
            themable = true,
            numbers = 'none',        -- can be "none" | "ordinal" | "buffer_id" | "both"
            close_command = 'bdelete! %d', -- can be a string | function
            right_mouse_command = 'bdelete! %d',
            left_mouse_command = 'buffer %d',
            middle_mouse_command = nil,

            -- Styling
            indicator = {
                icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'icon', -- can be 'icon' | 'underline' | 'none'
            },
            buffer_close_icon = '󰅖',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',

            -- Behavior
            max_name_length = 18,
            max_prefix_length = 15,
            truncate_names = true,
            tab_size = 18,
            diagnostics = 'nvim_lsp', -- show LSP diagnostics in tabs
            diagnostics_update_in_insert = false,

            -- Display diagnostics icons
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match 'error' and ' ' or ' '
                return ' ' .. icon .. count
            end,

            -- Show only specific buffers
            offsets = {
                {
                    filetype = 'neo-tree',
                    text = 'File Explorer',
                    text_align = 'center',
                    separator = true,
                },
            },

            color_icons = true,
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = true,
            show_duplicate_prefix = true,
            persist_buffer_sort = true,
            separator_style = 'slant', -- "slant" | "slope" | "thick" | "thin" | "padded_slant"
            enforce_regular_tabs = false,
            always_show_bufferline = true,
            hover = {
                enabled = true,
                delay = 200,
                reveal = { 'close' },
            },
            sort_by = 'insert_after_current', -- 'insert_after_current' | 'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs'
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
