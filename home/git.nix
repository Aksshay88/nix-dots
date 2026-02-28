{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Aksshay88";
      user.email = "aksshaybala8846@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };

  programs.lazygit.enable = true;
}
