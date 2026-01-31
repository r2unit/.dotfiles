# Custom Neovim IDE

A user-friendly Neovim configuration designed to work like a modern IDE with TUI interface.

## Features

### 🎨 IDE-Like Interface
- File explorer sidebar (auto-opens on startup)
- Visual buffer/tab bar at the top
- Colorful status bar showing current mode
- Welcome screen with quick tips
- Smooth notifications

### 🚀 Beginner Friendly
- **Auto INSERT mode** - New/empty files automatically enter typing mode
- **No Vim knowledge needed** - Uses familiar Ctrl shortcuts
- **Visual mode indicators** - Color-coded status bar (Blue=NORMAL, Green=INSERT, etc.)
- **Mouse support** - Click anywhere to navigate
- **Auto-save formatting** - Code formats automatically when you save

### 🛠️ IDE Features
- LSP support for multiple languages (Python, Go, Rust, JavaScript, TypeScript, C, Lua)
- Code completion with Tab
- Fuzzy file finding (Ctrl+P)
- Search in files (Ctrl+F)
- Integrated terminal (Ctrl+\)
- Debugging support (F5, F9, F10, F11)
- Git integration with visual indicators
- Code actions (F4)
- Rename symbols (F2)

### 📦 Custom IDE Plugin

Located in `lua/ide/`:
- `init.lua` - Main plugin entry
- `ui.lua` - UI configuration and styling
- `layout.lua` - IDE layout manager
- `keymaps.lua` - Additional IDE keybindings
- `autocmds.lua` - Auto-commands for IDE behavior
- `welcome.lua` - Welcome screen

## Quick Start

1. **Open Neovim:**
   ```bash
   nvim
   ```

2. **First time:** Plugins will auto-install (wait a moment)

3. **You'll see:**
   - Welcome message
   - File explorer on the left
   - Empty buffer ready to type

4. **Start coding:**
   - Press `i` to enter INSERT mode (or it auto-enters for new files)
   - Type your code
   - `Ctrl+S` to save (works in INSERT mode!)
   - `Ctrl+P` to open files
   - `Ctrl+F` to search
   - `Space` to see all commands

## Customization

### Change IDE behavior

Edit `init.lua`:
```lua
require("ide").setup({
  auto_insert_mode = true,    -- Auto-enter INSERT mode for new files
  show_welcome = true,         -- Show welcome message
  auto_open_explorer = false,  -- Auto-open file explorer on startup
  default_layout = "ide",      -- Default layout
})
```

### Disable custom IDE plugin

Comment out in `init.lua`:
```lua
-- require("ide").setup({ ... })
```

## File Structure

```
~/.config/nvim/
├── init.lua                  # Main entry point
├── lua/
│   ├── config/
│   │   ├── options.lua      # Neovim options
│   │   ├── keymaps.lua      # Keybindings
│   │   └── plugins.lua      # Plugin configurations
│   └── ide/                 # Custom IDE plugin
│       ├── init.lua
│       ├── ui.lua
│       ├── layout.lua
│       ├── keymaps.lua
│       ├── autocmds.lua
│       └── welcome.lua
├── KEYBINDINGS.md           # Keybinding reference
└── README.md                # This file
```

## No LazyVim!

This configuration uses **lazy.nvim** (just the plugin manager), NOT LazyVim (the distribution). Everything is custom-built for a user-friendly IDE experience.

## Support

- Press `Ctrl+,` to see all keybindings
- Press `Space` for command menu
- Read `KEYBINDINGS.md` for detailed shortcuts
- Type `:checkhealth` to diagnose issues
