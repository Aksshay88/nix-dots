{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --- CLI essentials ---
    eza                # modern ls
    bat                # modern cat
    fd                 # modern find
    ripgrep            # modern grep
    fzf                # fuzzy finder
    zoxide             # smart cd
    jq                 # JSON processor
    tree               # directory tree
    coreutils          # GNU coreutils
    gawk               # GNU awk
    gnused             # GNU sed

    # --- Dev tools ---
    lazygit            # git TUI
    lazydocker         # docker TUI
    gh                 # GitHub CLI
    glab               # GitLab CLI
    nodejs             # Node.js
    pnpm               # fast npm
    python3            # Python
    lua                # Lua
    pipx               # Python CLI tool installer

    # --- Cloud & infra ---
    awscli2            # AWS CLI
    google-cloud-sdk   # gcloud
    kubectl            # Kubernetes CLI

    # --- Media & misc ---
    ffmpeg             # media processing
    chafa              # terminal image viewer
    fastfetch          # system info
    glow               # markdown viewer
    scrcpy             # Android screen mirror
    ngrok              # tunnels

    # --- Container ---
    colima             # container runtime for macOS
    docker             # Docker CLI
    docker-compose     # Docker Compose

    # --- Fonts ---
    nerd-fonts.hack
    nerd-fonts.victor-mono
    nerd-fonts.monaspace
  ];
}
