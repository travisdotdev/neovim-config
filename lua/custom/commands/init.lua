-- Auto-load all command modules in the custom/commands directory

local commands_dir = vim.fn.stdpath 'config' .. '/lua/custom/commands'

-- Get all lua files in the commands directory
local command_files = vim.fn.glob(commands_dir .. '/*.lua', false, true)

for _, file in ipairs(command_files) do
  local filename = vim.fn.fnamemodify(file, ':t:r')

  -- Skip init.lua itself
  if filename ~= 'init' then
    local ok, module = pcall(require, 'custom.commands.' .. filename)
    if ok and type(module) == 'table' and type(module.setup) == 'function' then
      module.setup()
    end
  end
end
