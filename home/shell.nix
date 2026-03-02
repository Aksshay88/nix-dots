{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "awesomepanda";
      plugins = [
        "git"
        "web-search"
      ];
    };

    shellAliases = {
      # General
      c = "clear";
      x = "exit";
      lg = "lazygit";
      ld = "lazydocker";

      # eza (ls replacement)
      ls = "eza";
      l = "eza -lbF --git";
      ll = "eza -lbGF --git";
      llm = "eza -lbGd --git --sort=modified";
      la = "eza -lbhHigUmuSa --time-style=long-iso --git --color-scale";
      lx = "eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale";
      lS = "eza -1";
      lt = "eza --tree --level=2";
      "claude-aws" = "/Users/mac123/.claude-aws/start-claude-aws.sh";
      "nix-rebuild" = "sudo darwin-rebuild switch --flake ~/.config/nix-darwin#Aksshays-MacBook-Pro";
    };

    initContent = ''
      # Source secrets file (API keys, tokens — not in git)
      [ -f ~/.secrets ] && source ~/.secrets

      # Add ~/.local/bin to PATH (needed for Claude Code native installation)
      export PATH="$HOME/.local/bin:$PATH"

      # eza dotfiles alias (can't be in shellAliases due to quotes)
      alias l.="eza -a | grep -E '^\.'"

      # Show fastfetch on terminal open (skip in nested shells and tmux)
      if [[ -z "$FASTFETCH_SHOWN" && -z "$TMUX" ]]; then
        export FASTFETCH_SHOWN=1
        fastfetch
      fi
    '';
  };

  # Direnv for per-project environments
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Zoxide (also initialized in initExtra above for prompt integration)
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # fzf
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
