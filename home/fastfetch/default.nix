{ pkgs, ... }:

let
  # Nix doesn't support \u escape sequences, so we need to get ESC char via JSON
  esc = builtins.fromJSON ''"\\u001b"'';
in
{
  # Copy the logo image to ~/.config/fastfetch/
  home.file.".config/fastfetch/aottt.png".source = ./aottt.png;

  # Fastfetch JSON config
  home.file.".config/fastfetch/config.jsonc".text = builtins.toJSON {
    "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

    logo = {
      source = "~/.config/fastfetch/aottt.png";
      type = "kitty-direct";
      height = 22;
      width = 28;
    };

    display = {
      separator = " ➜  ";
    };

    modules = [
      "break"
      {
        type = "os";
        key = " DISTRO";
        keyColor = "yellow";
      }
      {
        type = "kernel";
        key = "│ ├";
        keyColor = "yellow";
      }
      {
        type = "packages";
        key = "│ ├󰏖";
        keyColor = "yellow";
      }
      {
        type = "shell";
        key = "│ └";
        keyColor = "yellow";
      }
      {
        type = "wm";
        key = " DE/WM";
        keyColor = "blue";
      }
      {
        type = "wmtheme";
        key = "│ ├󰉼";
        keyColor = "blue";
      }
      {
        type = "icons";
        key = "│ ├󰀻";
        keyColor = "blue";
      }
      {
        type = "cursor";
        key = "│ ├";
        keyColor = "blue";
      }
      {
        type = "terminalfont";
        key = "│ ├";
        keyColor = "blue";
      }
      {
        type = "terminal";
        key = "│ └";
        keyColor = "blue";
      }
      {
        type = "host";
        key = "󰌢 SYSTEM";
        keyColor = "green";
      }
      {
        type = "cpu";
        key = "│ ├󰻠";
        keyColor = "green";
      }
      {
        type = "gpu";
        key = "│ ├󰻑";
        format = "{2}";
        keyColor = "green";
      }
      {
        type = "display";
        key = "│ ├󰍹";
        keyColor = "green";
        compactType = "original-with-refresh-rate";
      }
      {
        type = "memory";
        key = "│ ├󰾆";
        keyColor = "green";
      }
      {
        type = "swap";
        key = "│ ├󰓡";
        keyColor = "green";
      }
      {
        type = "uptime";
        key = "│ ├󰅐";
        keyColor = "green";
      }
      {
        type = "display";
        key = "│ └󰍹";
        keyColor = "green";
      }
      {
        type = "sound";
        key = " AUDIO";
        format = "{2}";
        keyColor = "magenta";
      }
      {
        type = "player";
        key = "│ ├󰥠";
        keyColor = "magenta";
      }
      {
        type = "media";
        key = "│ └󰝚";
        keyColor = "magenta";
      }
      {
        type = "custom";
        format = "${esc}[90m  ${esc}[31m  ${esc}[32m  ${esc}[33m  ${esc}[34m  ${esc}[35m  ${esc}[36m  ${esc}[37m  ${esc}[38m  ${esc}[39m  ${esc}[39m    ${esc}[38m  ${esc}[37m  ${esc}[36m  ${esc}[35m  ${esc}[34m  ${esc}[33m  ${esc}[32m  ${esc}[31m  ${esc}[90m ";
      }
      "break"
    ];
  };
}
