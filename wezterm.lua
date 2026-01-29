local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local mux = wezterm.mux

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config.default_prog = { "cmd.exe ", "/c", "C:/Users/fancy/msys2/msys2_shell.cmd -where C:/Users/fancy/Documents -use-full-path -defterm -here -no-start -ucrt64 -shell bash" } 
end

wezterm.on('gui-startup', function(window)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

config.keys = {
    {
        key = 'F11',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.ToggleFullScreen
    }
}

config.default_cursor_style = 'SteadyBlock'
config.cursor_blink_rate = 0
config.enable_tab_bar = false
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.font_size = 9
config.color_scheme = 'Mashup Colors (terminal.sexy)'
config.audible_bell = "Disabled"

return config
