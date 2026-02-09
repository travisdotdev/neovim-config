return {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false,
    opts = {
        provider = 'claude',
        auto_suggestions_provider = 'claude',

        -- Force it to only use selected code/current buffer
        system_prompt = [[
You are an AI coding assistant. You can ONLY see:
1. Code the user explicitly selects
2. The current file they have open (if no selection)
3. Their direct question

Do not assume you have access to other files, directories, or project context unless explicitly provided.
    ]],

        -- Disable all automatic context gathering
        hints = {
            enabled = false,
        },

        -- Disable file scanning
        file_selector = {
            provider = 'native',
            ignore_patterns = {
                '*', -- Ignore everything by default
            },
        },

        vendors = {
            claude = {
                __inherited_from = 'openai',
                api_key_name = 'ANTHROPIC_API_KEY',
                endpoint = 'https://api.anthropic.com/v1',
                model = 'claude-sonnet-4-20250514',
                temperature = 0,
                max_tokens = 4096,

                -- disable extended thinking:
                extra_request_body = {
                    thinking = {
                        type = 'disabled',
                    },
                },
            },
        },

        behaviour = {
            auto_suggestions = false,
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = false,
        },

        mappings = {
            diff = {
                ours = 'co',
                theirs = 'ct',
                all_theirs = 'ca',
                both = 'cb',
                cursor = 'cc',
                next = ']x',
                prev = '[x',
            },
            suggestion = {
                accept = '<M-l>',
                next = '<M-]>',
                prev = '<M-[>',
                dismiss = '<C-]>',
            },
            jump = {
                next = ']]',
                prev = '[[',
            },
            submit = {
                normal = '<CR>',
                insert = '<C-s>',
            },
            sidebar = {
                switch_windows = '<Tab>',
                reverse_switch_windows = '<S-Tab>',
            },
        },

        windows = {
            position = 'right',
            wrap = true,
            width = 30,
            sidebar_header = {
                align = 'center',
                rounded = true,
            },
        },

        highlights = {
            diff = {
                current = 'DiffText',
                incoming = 'DiffAdd',
            },
        },

        diff = {
            autojump = true,
            list_opener = 'copen',
        },
    },

    build = 'make',

    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'stevearc/dressing.nvim',
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons',
        {
            'HakonHarnes/img-clip.nvim',
            event = 'VeryLazy',
            opts = {
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                },
            },
        },
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { 'markdown', 'Avante' },
            },
            ft = { 'markdown', 'Avante' },
        },
    },
}
