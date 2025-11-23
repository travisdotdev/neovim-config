-- Neo-tree configuration with hidden files enabled
return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
        { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
        filesystem = {
            filtered_items = {
                visible = true, -- This makes hidden files visible
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_by_name = {
                    -- Optional: still hide these specific files
                    -- '.git',
                    -- '.DS_Store',
                    -- 'thumbs.db',
                },
            },
            window = {
                mappings = {
                    ['\\'] = 'close_window',
                    ['H'] = 'toggle_hidden', -- Add a keybinding to toggle hidden files
                },
            },
        },
    },
}
