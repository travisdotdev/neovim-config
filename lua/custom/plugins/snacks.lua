return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = function()
        ---@diagnostic disable: undefined-global
        -- Collection of ASCII art headers
        local headers = {
            [[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ██╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗  ██║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔██╗ ██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╗██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚████║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝  ╚═══╝

      ]],

            -- Header 3: Slant
            [[

    _   __                _
   / | / /__  ____ _   __(_)___ ___
  /  |/ / _ \/ __ \ | / / / __ `__ \
 / /|  /  __/ /_/ / |/ / / / / / / /
/_/ |_/\___/\____/|___/_/_/ /_/ /_/

      ]],

            -- Header 4: Block
            [[

 ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.
•█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪
▐█▐▐▌▐▀▀▪▄█▀▄   ▐█▐█•▐█·▐█ ▌▐▌▐█·
██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌
▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀

      ]],

            -- Header 5: Calvin S
            [[

┌┐┌┌─┐┌─┐┬  ┬┬┌┬┐
│││├┤ │ │└┐┌┘││││
┘└┘└─┘└─┘ └┘ ┴┴ ┴

      ]],

            -- Header 6: DOS Rebel
            [[

 ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
 ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██
▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░
         ░    ░  ░    ░ ░        ░   ░         ░
                                ░
      ]],
        }

        -- Select random header
        math.randomseed(os.time())
        local header = headers[math.random(#headers)]

        return {
            -- Enable the components you want
            bigfile = { enabled = true },
            dashboard = {
                enabled = true,
                preset = {
                    header = header,
                    -- stylua: ignore
                    ---@type snacks.dashboard.Item[]
                    keys = {
                        { icon = ' ', key = 'f', desc = 'Find File', action = ':Telescope find_files' },
                        { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
                        { icon = ' ', key = 'r', desc = 'Recent Files', action = ':Telescope oldfiles' },
                        { icon = ' ', key = 'g', desc = 'Find Text', action = ':Telescope live_grep' },
                        { icon = ' ', key = 'c', desc = 'Config', action = ':e ~/.config/nvim/init.lua' },
                        { icon = ' ', key = '?', desc = 'Cheat Sheet', action = ':e ~/.config/nvim/cheatsheet.md' },
                        { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
                        { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy' },
                        { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
                    },
                },
                sections = {
                    { section = 'header' },
                    { section = 'keys',  gap = 1, padding = 1 },
                    {
                        pane = 2,
                        section = 'terminal',
                        cmd = 'fortune -s | cowsay',
                        height = 8,
                        padding = 1,
                        indent = 4,
                    },
                    { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
                    { pane = 2, icon = ' ', title = 'Projects',     section = 'projects',     indent = 2, padding = 1 },
                    {
                        pane = 2,
                        icon = ' ',
                        title = 'Git Status',
                        section = 'terminal',
                        enabled = function()
                            return Snacks.git.get_root() ~= nil
                        end,
                        cmd = 'git status --short --branch --renames',
                        height = 5,
                        padding = 1,
                        indent = 3,
                    },
                    { section = 'startup' },
                },
            },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            styles = {
                notification = {
                    wo = { wrap = true }, -- Wrap notifications
                },
            },
        }
    end,
    keys = {
        {
            '<leader>.',
            function()
                Snacks.scratch()
            end,
            desc = 'Toggle Scratch Buffer',
        },
        {
            '<leader>S',
            function()
                Snacks.scratch.select()
            end,
            desc = 'Select Scratch Buffer',
        },
        {
            '<leader>n',
            function()
                Snacks.notifier.show_history()
            end,
            desc = 'Notification History',
        },
        {
            '<leader>bd',
            function()
                Snacks.bufdelete()
            end,
            desc = 'Delete Buffer',
        },
        {
            '<leader>cR',
            function()
                Snacks.rename.rename_file()
            end,
            desc = 'Rename File',
        },
        {
            '<leader>gB',
            function()
                Snacks.gitbrowse()
            end,
            desc = 'Git Browse',
        },
        {
            '<leader>gb',
            function()
                Snacks.git.blame_line()
            end,
            desc = 'Git Blame Line',
        },
        {
            '<leader>gf',
            function()
                Snacks.lazygit.log_file()
            end,
            desc = 'Lazygit Current File History',
        },
        {
            '<leader>gg',
            function()
                Snacks.lazygit()
            end,
            desc = 'Lazygit',
        },
        {
            '<leader>gl',
            function()
                Snacks.lazygit.log()
            end,
            desc = 'Lazygit Log (cwd)',
        },
        {
            ']]',
            function()
                Snacks.words.jump(vim.v.count1)
            end,
            desc = 'Next Reference',
        },
        {
            '[[',
            function()
                Snacks.words.jump(-vim.v.count1)
            end,
            desc = 'Prev Reference',
        },
    },
    init = function()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'VeryLazy',
            callback = function()
                -- Create some toggle functions
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd

                -- Setup some useful vim.notify overrides
                ---@diagnostic disable-next-line: duplicate-set-field
                vim.notify = function(msg, level, opts)
                    return Snacks.notifier.notify(msg, level, opts)
                end
            end,
        })
    end,
}
