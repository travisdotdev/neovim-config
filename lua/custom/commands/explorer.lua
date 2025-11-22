-- Open current file in system file explorer
-- Usage: :Explorer or <leader>e

local M = {}

function M.open_in_explorer()
  local file_path = vim.fn.expand '%:p'

  if file_path == '' then
    print 'No file is currently open'
    return
  end

  local dir_path = vim.fn.fnamemodify(file_path, ':h')
  local command

  -- Detect OS and use appropriate command
  if vim.fn.has 'mac' == 1 then
    -- macOS
    command = string.format('open "%s"', dir_path)
  elseif vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1 then
    -- Windows - this will open and select the file
    command = string.format('explorer /select,"%s"', file_path)
  else
    -- Linux - try common file managers
    local file_managers = { 'xdg-open', 'nautilus', 'dolphin', 'thunar', 'nemo' }
    local found = false

    for _, fm in ipairs(file_managers) do
      if vim.fn.executable(fm) == 1 then
        command = string.format('%s "%s" &', fm, dir_path)
        found = true
        break
      end
    end

    if not found then
      print 'No file manager found. Install xdg-utils or a file manager.'
      return
    end
  end

  -- Execute the command
  vim.fn.system(command)
  print('Opened in file explorer: ' .. dir_path)
end

function M.setup()
  -- Create the command
  vim.api.nvim_create_user_command('Explorer', M.open_in_explorer, {
    desc = 'Open current file location in system file explorer',
  })

  -- Add keybinding
  vim.keymap.set('n', '<leader>e', M.open_in_explorer, {
    desc = 'Open in file explorer',
    silent = true,
  })
end

return M
