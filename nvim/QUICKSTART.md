# Neovim Quick Start Guide

## Spotlight/Search Features (Easy to Use!)

### Quick File Open (Like Spotlight)
- `Ctrl+P` - Quick open any file (fuzzy search)
- `Ctrl+O` - Same as above
- `Space ff` - Find files

### Search Everything
- `Ctrl+F` - Search text in all files (live grep)
- `Ctrl+Shift+F` - Search current word everywhere
- `Space fg` - Find in files (grep)

### Command Palette
- `Ctrl+Shift+P` - Open command palette (all commands)
- `Space Space` - Same as above

### Quick Navigation
- `s` + 2 chars - Flash jump to any location on screen
- `S` - Flash treesitter (jump to code blocks)
- `-` - Open file browser at current file
- `_` - Open file browser at project root

### Buffer/Tab Management
- `Ctrl+Tab` - Next buffer
- `Ctrl+Shift+Tab` - Previous buffer
- `Alt+1-9` - Jump to buffer 1-9
- `Space fb` - Find buffers (fuzzy search)

### Harpoon (Quick File Switching)
- `Space a` - Add current file to harpoon
- `Space h` - Open harpoon menu
- `Space 1-5` - Jump to harpoon file 1-5

### More Search Options (Space f)
- `Space fr` - Recent files
- `Space fs` - Find symbols in file
- `Space fS` - Find symbols in workspace
- `Space fd` - Find diagnostics (errors/warnings)
- `Space fk` - Find keymaps
- `Space fc` - Find colorscheme

### Other Useful Shortcuts
- `Space .` - Resume last search
- `Space /` - Search in current buffer
- `Space :` - Command history
- `Esc` - Clear search highlight

## File Operations
- `Ctrl+S` - Save file
- `Ctrl+W` - Close buffer
- `Ctrl+Q` - Quit
- `Ctrl+N` - New file
- `Ctrl+B` - Toggle file explorer
- `Space e` - Toggle file explorer

## Code Navigation
- `gd` - Go to definition
- `gr` - Go to references
- `gi` - Go to implementation
- `K` - Show documentation
- `F2` - Rename symbol
- `F3` - Find references
- `F4` - Code actions
- `F12` - Go to definition

## Terminal
- `Ctrl+\` - Toggle terminal
- `Esc` (in terminal) - Exit terminal mode

## Editing
- `Ctrl+/` - Toggle comment
- `Ctrl+Z` - Undo
- `Ctrl+Shift+Z` - Redo
- `jk` or `jj` - Exit insert mode
- `Alt+J` - Move line down
- `Alt+K` - Move line up

## Window Navigation
- `Ctrl+H` - Move to left window
- `Ctrl+J` - Move to bottom window
- `Ctrl+K` - Move to top window
- `Ctrl+L` - Move to right window

## Tips
1. Press `Space` and wait - which-key will show you all available commands
2. In Telescope (search), use `Ctrl+J/K` to move up/down
3. Use `Esc` or `q` to close Telescope
4. Telescope supports fuzzy search - just type parts of what you're looking for

## First Time Setup
Run these commands in Neovim:
1. `:Lazy sync` - Install all plugins
2. `:Mason` - Install language servers
3. Restart Neovim

Enjoy your easy-to-use Neovim setup!
