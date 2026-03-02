{ pkgs, lib, ... }:

{
  imports = [
    ./packages.nix
    ./shell.nix
    ./git.nix
    ./tmux.nix
    ./kitty.nix
    ./neovim
    ./fastfetch
  ];

  home.username = "mac123";
  home.homeDirectory = lib.mkForce "/Users/mac123";
  home.stateVersion = "24.11";

  # Let home-manager manage itself
  programs.home-manager.enable = true;
}
