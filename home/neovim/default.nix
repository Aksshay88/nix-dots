{ pkgs, lib, ... }:

let
  # Helper to fetch plugins not in nixpkgs
  pluginFromGitHub = owner: repo: rev: hash:
    pkgs.vimUtils.buildVimPlugin {
      pname = repo;
      version = rev;
      doCheck = false;
      src = pkgs.fetchFromGitHub {
        inherit owner repo rev hash;
      };
    };
in
{
  # Symlink our lua config into nvim's config directory
  xdg.configFile."nvim/init.lua".source = ./init.lua;
  xdg.configFile."nvim/lua/nukevim".source = ./lua/nukevim;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # System dependencies that plugins need at runtime
    extraPackages = with pkgs; [
      # Telescope dependencies
      ripgrep
      fd

      # LSP servers (replaces Mason downloads)
      lua-language-server
      nil                        # Nix LSP
      typescript-language-server
      nodePackages.prettier
      rust-analyzer
      gopls
      pyright

      # Formatters & linters
      stylua
      nixpkgs-fmt
      eslint_d
      black
      isort

      # Markdown preview
      nodejs
    ];

    plugins = with pkgs.vimPlugins; [
      # --- Core dependencies ---
      plenary-nvim
      nui-nvim
      nvim-web-devicons
      mini-nvim

      # --- Colorschemes ---
      gruvbox-nvim
      tokyonight-nvim
      nordic-nvim

      # --- UI ---
      alpha-nvim
      lualine-nvim
      nvim-notify
      noice-nvim
      transparent-nvim

      # --- Navigation ---
      nvim-tree-lua
      telescope-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      harpoon
      vim-tmux-navigator

      # --- Editing ---
      vim-surround
      vim-ReplaceWithRegister
      comment-nvim
      nvim-autopairs
      nvim-ts-autotag
      undotree

      # --- Completion ---
      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-nvim-lsp
      cmp_luasnip
      luasnip
      friendly-snippets
      lspkind-nvim

      # --- LSP ---
      nvim-lspconfig
      mason-nvim
      mason-lspconfig-nvim
      lspsaga-nvim
      typescript-nvim
      null-ls-nvim
      none-ls-nvim
      mason-null-ls-nvim

      # --- Treesitter ---
      (nvim-treesitter.withAllGrammars)

      # --- Git ---
      gitsigns-nvim
      lazygit-nvim

      # --- Language-specific ---
      rustaceanvim
      crates-nvim

      # --- Copilot ---
      copilot-vim

      # --- Markdown ---
      markdown-preview-nvim
      render-markdown-nvim
      obsidian-nvim

      # --- Database ---
      vim-dadbod
      vim-dadbod-ui

      # --- Misc ---
      trouble-nvim
      vim-wakatime
      presence-nvim
      snacks-nvim
      gen-nvim
      ChatGPT-nvim

      # --- Plugins not in nixpkgs (fetched from GitHub) ---
      (pluginFromGitHub "szw" "vim-maximizer" "master"
        "sha256-+VPcMn4NuxLRpY1nXz7APaXlRQVZD3Y7SprB/hvNKww=")
      (pluginFromGitHub "nvzone" "typr" "main"
        "sha256-PNkoz91RmlZnRrdStAz5b7pGaWv27UOQU/9abYNP/5E=")
      (pluginFromGitHub "nvzone" "volt" "main"
        "sha256-5Xao1+QXZOvqwCXL6zWpckJPO1LDb8I7wtikMRFQ3Jk=")
      (pluginFromGitHub "xeluxee" "competitest.nvim" "master"
        "sha256-AL4NaLxnmGyoG585njmU5SOxps51XJ4ZJa2qeGlzrlE=")
      (pluginFromGitHub "javiorfo" "nvim-soil" "master"
        "sha256-M1UUQtFIwhFQ1B/4K1ZkcgxGN1ukQeYLk/QL+1TMbDU=")
      (pluginFromGitHub "javiorfo" "nvim-nyctophilia" "master"
        "sha256-MNnNrP5SV7jjGa4Pemiaj7rpg+IktTOT2SE4uIqqKas=")
      (pluginFromGitHub "ThePrimeagen" "vim-be-good" "master"
        "sha256-yrNZV90yiHIxw0OMSSvi5SMApR2oFT8EpvF6TiUlC88=")
      (pluginFromGitHub "kawre" "leetcode.nvim" "master"
        "sha256-PqfDPTKiM64tIi/BSQKDsE5rjmmuDHcBB91I3dZ4El8=")
      (pluginFromGitHub "bitspaceorg" "weather-reporto.nvim" "master"
        "sha256-5hoywImVGoWPo26Y7lN/zUkapSTRj3PsMLhb7ExWS+4=")
    ];
  };
}
