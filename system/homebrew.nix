{ ... }:

{
  homebrew = {
    enable = true;

    # Automatically cleanup packages not in config
    onActivation = {
      autoUpdate = false;  # Don't auto-update on rebuild
      cleanup = "zap";     # Remove everything not declared here
      upgrade = true;      # Upgrade packages on rebuild
    };

    taps = [];


    # Homebrew formulae (CLI tools not in nixpkgs)
    brews = [
      "mpv"               # Video player for ani-cli (avoids Swift compile in nixpkgs)
      "sketchybar"        # Custom macOS menu bar
      "gemini-cli"        # Gemini AI CLI
      "media-control"     # macOS media control
      "nowplaying-cli"    # Currently playing music
      "switchaudio-osx"   # Audio device switcher
      "taproom"           # Formula development
    ];

    # macOS GUI applications
    casks = [
      "aerospace"         # Tiling window manager
      "bruno"            # API client (Postman alternative)
      "copilot-cli"      # GitHub Copilot CLI
      "obs"              # Open Broadcaster (not in nixpkgs for macOS)
      "sf-symbols"       # Apple SF Symbols

      # Apple fonts (not in nixpkgs)
      "font-sf-mono"
      "font-sf-pro"
      "font-noto-sans-symbols-2"

      # Keep for now, transition later
      "iterm2"           # Alternative terminal (you have Kitty)
      "android-platform-tools"  # Can migrate to nixpkgs android-tools
    ];

    # Mac App Store apps (requires mas CLI)
    # masApps = {
    #   "Xcode" = 497799835;
    # };
  };
}