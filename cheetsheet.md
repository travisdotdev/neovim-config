# Neovim Cheat Sheet

## Movement

- `h/j/k/l` - Left/Down/Up/Right
- `w` - Next word
- `b` - Previous word
- `0` - Start of line
- `$` - End of line
- `gg` - Start of file
- `G` - End of file
- `<C-d>` - Scroll down (centered)
- `<C-u>` - Scroll up (centered)

## Editing

- `i` - Insert before cursor
- `a` - Insert after cursor
- `o` - New line below
- `O` - New line above
- `dd` - Delete line
- `yy` - Yank (copy) line
- `p` - Paste after cursor
- `u` - Undo
- `<C-r>` - Redo
- `jk` - Exit insert mode (custom)

## Visual Mode

- `v` - Visual mode (character)
- `V` - Visual line mode
- `<C-v>` - Visual block mode
- `jk` - Exit visual mode (custom)

## Search

- `/pattern` - Search forward
- `?pattern` - Search backward
- `n` - Next search result (centered)
- `N` - Previous search result (centered)
- `*` - Search word under cursor

## Windows

- `<C-h/j/k/l>` - Navigate between windows
- `<C-w>s` - Split horizontal
- `<C-w>v` - Split vertical
- `<C-w>q` - Quit window
- `<C-Up/Down/Left/Right>` - Resize windows

## Buffers

- `<S-h>` - Previous buffer
- `<S-l>` - Next buffer
- `<leader>bd` - Delete buffer
- `<leader><leader>` - Find buffers (Telescope)

## Leader Commands (Space)

### Files

- `<leader>w` - Save file
- `<leader>e` - Toggle file explorer (Neo-tree)
- `<leader>o` - Focus file explorer
- `<leader>fr` - Revert file to saved state
- `<leader>fy` - Copy relative file path
- `<leader>fY` - Copy absolute file path

### Search (Telescope)

- `<leader>sf` - Search files
- `<leader>sg` - Search with grep
- `<leader>sw` - Search current word
- `<leader>sr` - Resume last search
- `<leader>sh` - Search help
- `<leader>sk` - Search keymaps

### Git

- `<leader>gp` - Preview git hunk
- `<leader>gb` - Git blame line
- `<leader>gs` - Stage git hunk
- `<leader>gr` - Reset git hunk
- `]h` - Next git hunk
- `[h` - Previous git hunk

### Debug (DAP)

- `<leader>db` - Toggle breakpoint
- `<leader>dc` - Continue
- `<leader>di` - Step into
- `<leader>do` - Step over
- `<leader>dO` - Step out
- `<leader>dt` - Terminate

### Python

- `<leader>vs` - Select Python venv
- `<leader>dpr` - Debug Python test method
- `<leader>dpc` - Debug Python test class

### Terminal

- `<leader>tf` - Toggle terminal
- `<leader>tn` - Exit terminal mode
- `<leader>th/j/k/l` - Navigate from terminal

### Toggle Options

- `<leader>th` - Toggle inlay hints
- `<leader>tm` - Toggle markdown rendering
- `<leader>tn` - Toggle line numbers
- `<leader>tr` - Toggle relative numbers
- `<leader>ts` - Toggle spell check
- `<leader>tw` - Toggle line wrap

### Diagnostics

- `<leader>q` - Open quickfix list
- `<leader>d` - Show diagnostic
- `]d` - Next diagnostic
- `[d` - Previous diagnostic

### Other

- `<leader>a` - Open dashboard
- `<leader>/` - Search in current buffer
- `<leader>;` - Repeat last command

## LSP Commands

- `grd` - Go to definition
- `grr` - Go to references
- `gri` - Go to implementation
- `grt` - Go to type definition
- `grn` - Rename symbol
- `gra` - Code action
- `K` - Hover documentation
- `gO` - Document symbols
- `gW` - Workspace symbols

## Text Objects

- `ciw` - Change inner word
- `ci"` - Change inside quotes
- `ci(` - Change inside parentheses
- `vip` - Select paragraph
- `dap` - Delete around paragraph

## Comments (Comment.nvim)

- `gcc` - Toggle line comment
- `gc` (motion) - Comment motion (e.g., `gcip` = comment paragraph)
- `gc` (visual) - Comment selection

## Marks

- `ma` - Set mark 'a'
- `'a` - Jump to mark 'a'
- `:marks` - Show all marks

## Macros

- `qa` - Start recording macro to register 'a'
- `q` - Stop recording
- `@a` - Play macro from register 'a'
- `@@` - Replay last macro

## Miscellaneous

- `:help <topic>` - Get help
- `:Lazy` - Plugin manager
- `:Mason` - LSP/Tool installer
- `:checkhealth` - Check Neovim health
- `<Esc>` - Clear search highlight
