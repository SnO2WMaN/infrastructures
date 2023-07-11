{pkgs, ...}: {
  programs.git = {
    enable = true;

    userName = "SnO2WMaN";
    userEmail = "me@sno2wman.net";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      core = {
        symlinks = "true";
      };
      pull = {
        rebase = "false";
      };
      push = {
        autoSetupRemote = "true";
      };
      fetch = {
        prune = "true";
      };
    };

    delta = {
      enable = true;
    };

    aliases = {
      c = "commit --verbose";
      initc = "commit --allow-empty -m 'Initial Commit'";
    };
  };
}
