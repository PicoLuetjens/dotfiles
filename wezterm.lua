local wezterm = require 'wezterm'

local config = {}

-- launch menu to select shell
config.launch_menu = {
    {
        label = 'Powershell',
        args = { 'powershell.exe', '-NoLogo' },
    },
    {
        label = 'CMD',
        args = { 'cmd.exe' },
    },
    {
        label = 'WSL',
        args = { 'wsl.exe' },
    },
}

-- Powershell as Standard-Shell(normal default Powershell)
config.default_prog = { 'powershell.exe', '-NoLogo' }

-- Powershell 7 as Standard-Shell(newer Powershell not always available, must be installed separately)
-- config.default_prog = { 'pwsh.exe', '-NoLogo' }

-- Font
config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'
config.font_size = 11

-- Tab Management
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- Window
config.window_background_opacity = 0.82
config.initial_cols = 120
config.initial_rows = 35

-- Blur behind window
-- config.win32_system_backdrop = 'Mica'

-- Theme
config.color_scheme = 'Catppuccin Mocha'

-- Cursor
config.default_cursor_style = 'BlinkingBar'

-- Scrollback
config.scrollback_lines = 10000

-- No Window Title Bar
-- config.window_decorations = 'RESIZE'



-- Key Bindings --

config.keys = {

    -- Launch Menu
    {
        key = 'l',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ShowLauncherArgs {
            flags = 'FUZZY|LAUNCH_MENU_ITEMS',
        },
    },

    -- Command Palette
    {
        key = 'p',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivateCommandPalette,
    },

    -- New Tab
    {
        key = 't',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },

    -- Change Tab
    {
        key = 'LeftArrow',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivateTabRelative(-1),
    },
    {
        key = 'RightArrow',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivateTabRelative(1),
    },

    -- Horizontal Split
    {
        key = 'd',
        mods = 'ALT|SHIFT',
        action = wezterm.action.SplitHorizontal {
            domain = 'CurrentPaneDomain',
        },
    },

    -- Vertical Split
    {
        key = 'd',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitVertical {
            domain = 'CurrentPaneDomain',
        },
    },

    -- Change Panes
    {
        key = 'LeftArrow',
        mods = 'ALT',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'RightArrow',
        mods = 'ALT',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = 'UpArrow',
        mods = 'ALT',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'DownArrow',
        mods = 'ALT',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },

    -- Close current Pane
    {
        key = 'w',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.CloseCurrentPane {
            confirm = true,
        },
    },

    -- Reload Config
    {
        key = 'r',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ReloadConfiguration,
    },
}

return config
