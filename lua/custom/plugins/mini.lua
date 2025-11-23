return {
    'echasnovski/mini.animate',
    event = 'VeryLazy',
    opts = {
        cursor = {
            enable = true,
            timing = require('mini.animate').gen_timing.cubic {
                easing = 'in-out',
                duration = 200,
                unit = 'total',
            },
            path = require('mini.animate').gen_path.angle(),
        },
        scroll = { enable = false },
        resize = { enable = false },
        open = { enable = false },
        close = { enable = false },
    },
}
