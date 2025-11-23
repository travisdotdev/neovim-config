return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ft = 'markdown',
  opts = {
    -- Render markdown when opening files
    enabled = true,
    -- Maximum heading level to render (1-6)
    max_file_size = 10.0,
    -- Log level (error, warn, info, debug)
    log_level = 'error',
    -- Render style
    heading = {
      -- Enable heading rendering
      enabled = true,
      -- Turn on / off all icon rendering
      icons = true,
      -- Heading symbols
      sign = true,
      -- Rendered width of headings
      width = 'full',
    },
    code = {
      -- Enable code block rendering
      enabled = true,
      -- Determines how code blocks are rendered
      -- 'none': no special rendering
      -- 'normal': adds a background
      -- 'language': adds language label
      -- 'full': adds background + language label
      style = 'full',
      -- Width of code blocks
      width = 'full',
      -- Highlight code blocks
      highlight = 'RenderMarkdownCode',
    },
    -- Render checkboxes
    checkbox = {
      enabled = true,
      unchecked = { icon = '󰄱 ' },
      checked = { icon = '󰱒 ' },
    },
  },
  config = function(_, opts)
    require('render-markdown').setup(opts)

    -- Keymaps to toggle rendering
    vim.keymap.set('n', '<leader>tm', '<cmd>RenderMarkdown toggle<cr>', { desc = 'Toggle [M]arkdown rendering' })
  end,
}
