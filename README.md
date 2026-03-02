# 🚀 Nix Development Environment

A **reproducible**, **declarative**, and **cross-platform** development environment using Nix, nix-darwin, and home-manager. Works on both macOS (Apple Silicon & Intel) and Linux machines.

## 📋 Table of Contents

- [What This Does](#-what-this-does)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
  - [macOS Setup](#macos-setup)
  - [Linux Setup](#linux-setup)
- [Post-Installation](#-post-installation)
- [Usage](#-usage)
- [Customization](#-customization)
- [Troubleshooting](#-troubleshooting)

## 🎯 What This Does

This configuration provides a complete, reproducible development environment with:

### **Core Tools**
- **Modern CLI replacements**: `eza` (ls), `bat` (cat), `fd` (find), `ripgrep` (grep), `fzf` (fuzzy finder), `zoxide` (smart cd)
- **Shell**: Zsh with Oh-My-Zsh, syntax highlighting, and autosuggestions
- **Terminal**: Kitty (GPU-accelerated terminal emulator)
- **Editor**: Neovim with custom configuration
- **Multiplexer**: Tmux for session management
- **Git**: Configured with Lazygit TUI

### **Development Stack**
- **Languages**: Node.js, Python 3, Lua
- **Package Managers**: pnpm, pipx
- **Cloud Tools**: AWS CLI v2, Google Cloud SDK, kubectl
- **Containers**: Docker, Docker Compose, Colima (macOS container runtime)
- **AI Tools**: Claude Code CLI, Claude Monitor

### **System Settings** (macOS only)
- Auto-hiding dock
- Show all file extensions
- Optimized keyboard repeat rates
- Experimental Nix features (flakes, nix-command)

## 📦 Prerequisites

### macOS
- macOS 11+ (Big Sur or later)
- Apple Silicon (M1/M2/M3) or Intel processor
- Admin access for system-level changes
- ~5GB free disk space

### Linux
- x86_64 architecture
- systemd-based distribution (Ubuntu, Fedora, etc.)
- ~3GB free disk space

## 🛠️ Installation

### macOS Setup

1. **Install Nix** (if not already installed):
```bash
# Official Nix installer with daemon and multi-user support
sh <(curl -L https://nixos.org/nix/install)

# Restart your terminal or source the profile
source /etc/bashrc  # or restart terminal
```

2. **Clone this repository**:
```bash
# Create config directory if it doesn't exist
mkdir -p ~/.config

# Clone the repository
git clone https://github.com/YOUR_USERNAME/nix-darwin.git ~/.config/nix-darwin

# Or if you have it locally, copy it
# cp -r /path/to/nix-darwin ~/.config/nix-darwin
```

3. **Customize for your machine**:
```bash
cd ~/.config/nix-darwin

# Edit flake.nix to match your username and hostname
vim flake.nix
# Change line 16: username = "YOUR_USERNAME";
# Change line 17: hostname = "YOUR_HOSTNAME";

# Get your hostname with:
hostname

# Edit git configuration
vim home/git.nix
# Update your name and email
```

4. **Initial nix-darwin installation**:
```bash
# Build and activate the configuration
nix run nix-darwin -- switch --flake ~/.config/nix-darwin#YOUR_HOSTNAME

# Example for the default configuration:
nix run nix-darwin -- switch --flake ~/.config/nix-darwin#Aksshays-MacBook-Pro
```

5. **Reload your shell**:
```bash
exec zsh
```

### Linux Setup

1. **Install Nix**:
```bash
# Official Nix installer
sh <(curl -L https://nixos.org/nix/install) --daemon

# Add experimental features to your Nix config
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

2. **Clone this repository**:
```bash
mkdir -p ~/.config
git clone https://github.com/YOUR_USERNAME/nix-darwin.git ~/.config/nix-darwin
```

3. **Customize for your user**:
```bash
cd ~/.config/nix-darwin

# Edit flake.nix to match your username
vim flake.nix
# Change line 16: username = "YOUR_USERNAME";

# Edit git configuration
vim home/git.nix
```

4. **Activate home-manager**:
```bash
# Build and activate (Linux uses standalone home-manager)
nix run home-manager -- switch --flake ~/.config/nix-darwin#YOUR_USERNAME

# Example:
nix run home-manager -- switch --flake ~/.config/nix-darwin#mac123
```

5. **Reload your shell**:
```bash
exec zsh
```

## 🔧 Post-Installation

### 1. **Create secrets file** (for API keys):
```bash
# Create a secrets file for environment variables
touch ~/.secrets
chmod 600 ~/.secrets

# Add your API keys (example):
cat >> ~/.secrets << 'EOF'
export OPENAI_API_KEY="sk-..."
export ANTHROPIC_API_KEY="sk-..."
export AWS_ACCESS_KEY_ID="..."
export AWS_SECRET_ACCESS_KEY="..."
EOF
```

### 2. **Container runtime** (macOS only):
```bash
# Start Colima (Docker Desktop alternative)
colima start --cpu 4 --memory 8 --disk 50

# Verify Docker works
docker run hello-world
```

### 3. **Configure Git** (if not using provided config):
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 4. **Install Claude Code** (if using custom installation):
```bash
# The configuration includes claude-code, but for custom setup:
# Follow instructions at https://github.com/anthropics/claude-code
```

## 📖 Usage

### Daily Commands

```bash
# Rebuild after configuration changes (macOS)
nix-rebuild  # Alias for: darwin-rebuild switch --flake ~/.config/nix-darwin#YOUR_HOSTNAME

# Rebuild after configuration changes (Linux)
home-manager switch --flake ~/.config/nix-darwin#YOUR_USERNAME

# Update all packages
nix flake update ~/.config/nix-darwin

# Garbage collection (clean old generations)
nix-collect-garbage -d

# Search for packages
nix search nixpkgs package-name
```

### Useful Aliases

The configuration includes many helpful aliases:

```bash
# Navigation
c       # clear
x       # exit
l       # eza with details
la      # eza with all files
lt      # eza tree view

# Development
lg      # lazygit
ld      # lazydocker

# Claude
claude-aws  # Start Claude AWS environment
```

## 🎨 Customization

### Adding Packages

Edit `home/packages.nix`:
```nix
home.packages = with pkgs; [
  # Add your packages here
  new-package-name
];
```

### Modifying Shell Configuration

Edit `home/shell.nix` for:
- Shell aliases
- Environment variables
- Zsh plugins
- Shell initialization

### Adding System-Level Settings (macOS)

Edit `system/default.nix` for:
- macOS defaults
- System packages
- Nix daemon settings

### Version Control Your Changes

```bash
cd ~/.config/nix-darwin
git add -A
git commit -m "feat: customize for my setup"
git remote add origin YOUR_REPO_URL
git push -u origin main
```

## 🚨 Troubleshooting

### Common Issues

#### "command not found" after installation
```bash
# Ensure Nix is in your PATH
echo $PATH | grep nix
# If missing, source the Nix profile
source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
```

#### Build fails with "error: attribute not found"
```bash
# Update flake inputs
nix flake update ~/.config/nix-darwin

# Check your hostname/username matches flake.nix
hostname
whoami
```

#### Permission denied errors (macOS)
```bash
# Ensure you're using sudo for darwin-rebuild
sudo darwin-rebuild switch --flake ~/.config/nix-darwin#YOUR_HOSTNAME
```

#### Colima/Docker issues (macOS)
```bash
# Reset Colima
colima delete
colima start --cpu 4 --memory 8 --disk 50
```

### Getting Help

1. Check Nix/nix-darwin documentation:
   - [Nix Manual](https://nixos.org/manual/nix/stable/)
   - [nix-darwin Options](https://daiderd.com/nix-darwin/manual/index.html)
   - [Home Manager Options](https://nix-community.github.io/home-manager/options.html)

2. Search for packages:
   - [Nixpkgs Search](https://search.nixos.org/packages)

3. Community:
   - [NixOS Discourse](https://discourse.nixos.org/)
   - [Nix Discord](https://discord.gg/nix)

## 📂 Project Structure

```
~/.config/nix-darwin/
├── flake.nix           # Main configuration entry point
├── flake.lock          # Pinned dependencies
├── system/
│   └── default.nix     # macOS system-level settings
└── home/
    ├── default.nix     # Home-manager entry point
    ├── packages.nix    # User packages
    ├── shell.nix       # Shell configuration (zsh)
    ├── git.nix         # Git settings
    ├── kitty.nix       # Terminal emulator config
    ├── tmux.nix        # Tmux configuration
    └── neovim/
        └── default.nix # Neovim configuration
```

## 🔄 Migration from Existing Setup

If you're migrating from a traditional dotfiles setup:

1. **Backup existing configs**:
```bash
mkdir ~/dotfiles-backup
cp -r ~/.zshrc ~/.gitconfig ~/.config ~/dotfiles-backup/
```

2. **Install this configuration** (following steps above)

3. **Migrate custom settings**:
   - Shell aliases → `home/shell.nix`
   - Git config → `home/git.nix`
   - Packages → `home/packages.nix`

4. **Test thoroughly** before removing backups

## 📝 License

Feel free to use and modify this configuration for your needs.

## 🙏 Acknowledgments

Built with:
- [Nix](https://nixos.org/)
- [nix-darwin](https://github.com/LnL7/nix-darwin)
- [Home Manager](https://github.com/nix-community/home-manager)
- [Nixpkgs](https://github.com/NixOS/nixpkgs)

---

**Happy Coding!** 🎉

For issues or questions, please open an issue on GitHub.