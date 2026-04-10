# Neovim AGENTS

## Commands

### Quick navigation
- `:e ~/.config/nvim/init.lua` - Edit config via command
- `<leader>rc` - Alternative to edit config

### Building & Debugging
- `<C-S-b>` - Build project (triggers make)
- `<C-M-j>/<C-M-k>` - Next/Previous quickfix entry

### Saving
- `<C-s>` (normal/insert) - Save current buffer
- `<C-M-s>` - Save all open buffers

### Quitting
- `<C-q>` - Close current window
- `<C-M-q>` - Close all windows

### Testing
- `<leader>tt` - Run tests in current file
- `<leader>tT` - Run all test files

### Debugging (DAP)
- `<F5>` - Start/Continue
- `<F11>` - Step into
- `<F10>` - Step over
- `<F9>` - Toggle breakpoint

### Quickfix Navigation
- `<C-M-j>` - Next quickfix entry
- `<C-M-k>` - Previous quickfix entry

## Architecture

### Core Files
- `init.lua` - Bootstrap and OS-specific shell configuration
- `lua/config/opts.lua` - All vim.opt settings
- `lua/config/keymaps.lua` - Global key mappings (leader = space)
- `lua/config/lsp.lua` - LSP attach handlers and diagnostics
- `lua/config/lazy.lua` - Lazy.nvim setup
- `lua/plugins/` - All plugin configurations
- `lua/config/*.lua` - Config modules

### Lazy.nvim Plugins
- `plugins/` - All plugin definitions
- `after/` - After-load plugin overrides
- `ftplugin/` - Filetype-specific overrides

### Key Design Patterns
1. **Leader-based**: Leader key = space, local leader = space
2. **Minimal philosophy**: Prefer defaults, no unnecessary extensions
3. **Windows compatibility**: Auto-detects PowerShell, handles shellslash
4. **LSP integration**: Uses blink.cmp for completion
5. **Test-first**: Neotest for all testing needs

## Important Constraints

- Never disable `vim.opt.hidden = true` - essential for this setup
- Shell is auto-detected; don't override on Windows
- Diagnostic virtual text wraps multi-line messages
- Undo files stored in `~/.vim/undodir`

## Gotchas

1. `<C-u>` has conflicting mapping to "Undo" in keymaps.lua and "Half page up" in opts - context matters
2. `<C-s>` is mapped to save, not default Neovim behavior
3. Windows users need PowerShell 7 (pwsh) in PATH or get warning
