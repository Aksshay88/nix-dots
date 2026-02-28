{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "MesloLGS NF Bold";
      size = 21;
    };

    settings = {
      # Window
      hide_window_decorations = "titlebar-only";
      dynamic_background_opacity = "yes";
      background_opacity = "0.90";
      background_blur = 16;

      # Cursor
      cursor = "#c8d3f5";
      cursor_text_color = "#1e2030";

      # URL
      url_color = "#4fd6be";

      # Colors — Tokyo Night Moon
      foreground = "#c8d3f5";
      background = "#1e2030";
      selection_foreground = "#c8d3f5";
      selection_background = "#2d3f76";

      # Tabs
      active_tab_foreground = "#1e2030";
      active_tab_background = "#82aaff";
      inactive_tab_foreground = "#545c7e";
      inactive_tab_background = "#1e2030";

      # Window borders
      active_border_color = "#82aaff";
      inactive_border_color = "#292e42";

      # 16 colors
      color0 = "#1b1d2b";
      color1 = "#ff757f";
      color2 = "#c3e88d";
      color3 = "#ffc777";
      color4 = "#82aaff";
      color5 = "#c099ff";
      color6 = "#86e1fc";
      color7 = "#c8d3f5";
      color8 = "#444a73";
      color9 = "#ff757f";
      color10 = "#c3e88d";
      color11 = "#ffc777";
      color12 = "#82aaff";
      color13 = "#c099ff";
      color14 = "#86e1fc";
      color15 = "#c8d3f5";
    };

    keybindings = {
      "ctrl+shift+a>m" = "set_background_opacity +0.03";
      "ctrl+shift+a>l" = "set_background_opacity -0.03";
    };
  };
}
