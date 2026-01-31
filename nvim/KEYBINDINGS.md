# Custom Neovim IDE - Quick Reference

**Auto-features enabled:**
- ✅ Opens with file explorer on the left
- ✅ Automatically enters INSERT mode in new/empty files
- ✅ Auto-formats on save
- ✅ Auto-removes trailing whitespace

## Essential Shortcuts (Works like VSCode/IDE)

### File Operations
- `Ctrl+S` - Save file (works in INSERT mode too!)
- `Ctrl+W` - Close current buffer/file
- `Ctrl+Q` - Quit (with confirmation)
- `Ctrl+Shift+Q` - Quit all
- `Ctrl+N` - New file (auto-enters INSERT mode)
- `Ctrl+O` - Open file (fuzzy finder)
- `Ctrl+P` - Quick open file (fuzzy finder)
- `Ctrl+Shift+P` - Command palette

### Navigation
- `Ctrl+Tab` - Next buffer/tab
- `Ctrl+Shift+Tab` - Previous buffer/tab
- `Alt+1` to `Alt+5` - Jump to buffer 1-5
- `Ctrl+B` - Toggle file explorer sidebar

### Editing
- `Ctrl+Z` - Undo
- `Ctrl+Shift+Z` - Redo
- `Ctrl+C` - Copy (in visual mode)
- `Ctrl+X` - Cut (in visual mode)
- `Ctrl+V` - Paste
- `Ctrl+A` - Select all
- `Ctrl+/` - Toggle comment
- `Alt+J` / `Alt+K` - Move line up/down

### Search & Replace
- `Ctrl+F` - Find in files (live grep)
- `Ctrl+Shift+F` - Find word under cursor
- `Ctrl+H` - Find and replace

### Code Actions
- `F2` - Rename symbol
- `F3` - Find references
- `F4` - Code actions
- `K` - Show documentation (hover)
- `gd` - Go to definition
- `gi` - Go to implementation

### Debugging
- `F5` - Start/Continue debugging
- `F9` - Toggle breakpoint
- `F10` - Step over
- `F11` - Step into
- `Shift+F11` - Step out

### Terminal
- `Ctrl+\` - Toggle terminal

### Autocomplete
- `Ctrl+Space` - Trigger autocomplete
- `Tab` - Next suggestion
- `Shift+Tab` - Previous suggestion
- `Enter` - Accept suggestion

## Leader Key Shortcuts (Space)

Press `Space` (leader key) to see all available shortcuts in a menu.

### Find (Space + f)
- `Space ff` - Find files
- `Space fg` - Find in files (grep)
- `Space fb` - Find buffers
- `Space fh` - Find help

### Go Language (Space + g)
- `Space gt` - Go test
- `Space gr` - Go run
- `Space gc` - Go coverage
- `Space gi` - Go implement
- `Space gf` - Go fill struct

### Rust Language (Space + r)
- `Space rt` - Rust test
- `Space rr` - Rust run
- `Space re` - Rust expand macro

### Other
- `Space e` - Toggle file explorer
- `Space fm` - Format file
- `Space ca` - Code actions

## IDE Commands

- `:IDE` - Toggle IDE layout
- `:IDELayout` - Open IDE layout with file explorer
- `Space l` - Open IDE layout

## Understanding Modes

**You'll see colored indicators in the status bar:**
- 🟦 NORMAL (Blue) - Navigation mode - Press `i` to start typing
- 🟩 INSERT (Green) - **Typing mode** - You can type normally here!
- 🟪 VISUAL (Purple) - Selection mode - Select text with mouse or keyboard
- 🟥 REPLACE (Red) - Replace mode
- 🟨 COMMAND (Yellow) - Command mode

## Tips

1. **Just start typing!** - New files automatically enter INSERT mode
2. **Press `Space` and wait** - A menu will appear showing all available shortcuts
3. **Press `Ctrl+,`** - See all keybindings
4. **Use mouse** - Mouse is enabled everywhere
5. **File Explorer** - Opens automatically on startup, toggle with `Ctrl+B`
6. **Exit INSERT mode** - Press `Esc` when done typing, then `Ctrl+S` to save
7. **Stay in INSERT mode** - Just use `Ctrl+S` to save without leaving INSERT mode!

## Getting Help

- Type `:Telescope keymaps` to search all keybindings
- Type `:WhichKey` to see the shortcut menu
- Press `Space fh` to search help documentation
