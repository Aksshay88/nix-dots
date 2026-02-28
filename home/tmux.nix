{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";
    mouse = true;
    keyMode = "vi";
    baseIndex = 1;
    historyLimit = 50000;
    prefix = "C-a";

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      tmux-thumbs
      {
        plugin = resurrect;
        extraConfig = "";
      }
      {
        plugin = continuum;
        extraConfig = "";
      }
    ];

    extraConfig = ''
      # True color support
      set -ga terminal-overrides ",xterm-256color:Tc"

      # Pane base index
      setw -g pane-base-index 1
      set -g renumber-windows on

      # Split windows
      unbind %
      bind | split-window -h -c "#{pane_current_path}"
      unbind '"'
      bind - split-window -v -c "#{pane_current_path}"

      # Pane resizing
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5
      bind -r m resize-pane -Z

      # Window management
      bind-key r command-prompt -I "#W" "rename-window '%%'"

      # Vi copy mode
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel
      unbind -T copy-mode-vi MouseDragEnd1Pane

      # Status bar position
      set -g status-position bottom

      # Tokyo Night theme (manual styling since the tmux plugin isn't in nixpkgs)
      set -g status-style "bg=#1a1b26,fg=#c0caf5"
      set -g window-status-current-style "bg=#7aa2f7,fg=#1a1b26,bold"
      set -g window-status-style "bg=#1a1b26,fg=#565f89"
      set -g pane-border-style "fg=#292e42"
      set -g pane-active-border-style "fg=#7aa2f7"
      set -g message-style "bg=#1a1b26,fg=#c0caf5"

      # Status bar content
      set -g status-left "#[fg=#7aa2f7,bold] #S "
      set -g status-right "#[fg=#565f89] %d/%m  %H:%M "
      set -g status-left-length 30
      set -g status-right-length 50
    '';
  };
}
