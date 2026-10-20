# Hyprland Configuration Structure

This file describes the structure and organization of the Hyprland configuration files located in `~/.config/hypr/`.

## Directory Tree

```text
~/.config/hypr/
├── STRUCTURE.md             # This file (documentation of the structure)
├── hyprland.conf            # Main entry point for Hyprland configuration
├── variables.conf           # General keybind variables and styling tokens
├── my.conf                  # Custom start-up programs/daemons
├── hypridle.conf            # Configuration for the idle management daemon (hypridle)
├── dynamic-cursors.conf     # Configuration for dynamic cursor behavior/plugin
├── scheme/                  # Color scheme files
│   ├── default.conf         # Default theme colors
│   └── current.conf         # Active theme colors (copied or symlinked)
├── scripts/                 # Helper shell/fish scripts
│   ├── configs.fish         # Script to manage configuration overrides
│   └── wsaction.fish        # Handles dynamic workspace groups and transitions
└── hyprland/                # Modular configuration files (sourced by hyprland.conf)
    ├── env.conf             # Environment variables (Wayland, QT, etc.)
    ├── general.conf         # Layout, gaps, borders, and main compositor behavior
    ├── input.conf           # Keyboard, mouse, and touchpad settings
    ├── misc.conf            # Focus rules, splash rendering, and daemon controls
    ├── animations.conf      # Window transition animations
    ├── decoration.conf      # Blur, opacity, rounding, and shadows
    ├── group.conf           # Tabbed window group layout settings
    ├── execs.conf           # Programs launched automatically on startup
    ├── rules.conf           # Window rules (floating, opacity, workspace assignments)
    ├── gestures.conf        # Multi-touch workspace swipe gestures
    ├── keybinds.conf        # System, application, media, and navigation hotkeys
    ├── scrolling.conf       # Advanced mouse and trackpad scrolling behavior
    └── monitors.conf        # Monitor layout, resolution, and refresh rate definitions
```

## Sourcing Flow

When Hyprland starts, it reads [hyprland.conf](file:///home/godka/.config/hypr/hyprland.conf) which sources other files in the following order:

1. **Colors & Styling Variables**:
   - Sourced from `scheme/current.conf` (generated/copied from `scheme/default.conf` on load)
   - Sourced from [variables.conf](file:///home/godka/.config/hypr/variables.conf) (contains gaps, border sizes, and keybind definitions)
   - Sourced from `~/.config/caelestia/hypr-vars.conf` (User-specific theme variables)
2. **System Configurations**:
   - Sourced modular configs from the `hyprland/` directory (e.g., `env.conf`, `general.conf`, `keybinds.conf`, etc.)
3. **User Overrides**:
   - Sourced from `~/.config/caelestia/hypr-user.conf`
   - Sourced from [dynamic-cursors.conf](file:///home/godka/.config/hypr/dynamic-cursors.conf)
   - Sourced from [my.conf](file:///home/godka/.config/hypr/my.conf) (user autostart entries)

## Keybinds & Customization Rules

- **Use Variables**: If you are creating or modifying keybindings (such as in [keybinds.conf](file:///home/godka/.config/hypr/hyprland/keybinds.conf)), always consider defining or using existing variables in [variables.conf](file:///home/godka/.config/hypr/variables.conf) (e.g. `$kbTerminal`, `$kbMoveWinToWs`) instead of hardcoding keys directly. This keeps configurations consistent and easy to customize.

