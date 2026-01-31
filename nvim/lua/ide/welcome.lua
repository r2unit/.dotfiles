local M = {}

function M.show()
  local lines = {
    "╔══════════════════════════════════════════════════════════════╗",
    "║           Welcome to Your Custom Neovim IDE!                ║",
    "╠══════════════════════════════════════════════════════════════╣",
    "║                                                              ║",
    "║  Quick Start:                                                ║",
    "║  • File explorer is on the left (Ctrl+B to toggle)          ║",
    "║  • Just press 'i' to start typing                           ║",
    "║  • Ctrl+S to save (works in INSERT mode!)                   ║",
    "║  • Ctrl+P to find files                                     ║",
    "║  • Space to see all commands                                ║",
    "║  • Ctrl+, to see all keybindings                            ║",
    "║                                                              ║",
    "║  Modes (shown in status bar):                               ║",
    "║  🟦 NORMAL - Press 'i' to start typing                       ║",
    "║  🟩 INSERT - You can type! Press Esc when done               ║",
    "║                                                              ║",
    "║  Need help? Check ~/.config/nvim/KEYBINDINGS.md             ║",
    "║                                                              ║",
    "╚══════════════════════════════════════════════════════════════╝",
  }

  print("\n")
  for _, line in ipairs(lines) do
    print(line)
  end
  print("\n")
end

return M
