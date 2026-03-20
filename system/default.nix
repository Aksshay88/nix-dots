{ pkgs, ... }:

{
  # Allow unfree packages (vscode, etc.)
  nixpkgs.config.allowUnfree = true;

  # System-level packages (things that need root or are macOS-specific)
  environment.systemPackages = with pkgs; [
    vim
  ];

  # Nix settings
  nix.settings = {
    experimental-features = "nix-command flakes";
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCUSeBs="
    ];
  };

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
