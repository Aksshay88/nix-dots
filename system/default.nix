{ pkgs, ... }:

{
  # Allow unfree packages (vscode, etc.)
  nixpkgs.config.allowUnfree = true;

  # System-level packages (things that need root or are macOS-specific)
  environment.systemPackages = with pkgs; [
    vim
  ];

  # Nix settings
  nix.settings.experimental-features = "nix-command flakes";

  # macOS system defaults
  system.defaults = {
    dock.autohide = true;
    dock.mru-spaces = false;
    finder.AppleShowAllExtensions = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };

  # Primary user
  system.primaryUser = "mac123";

  # Set Git commit hash for darwin-version
  system.configurationRevision = null;

  # Backwards compatibility
  system.stateVersion = 6;

  # Platform
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Enable zsh as default shell (system-level)
  programs.zsh.enable = true;
}
