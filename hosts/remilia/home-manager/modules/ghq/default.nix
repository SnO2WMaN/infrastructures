{pkgs, ...}: {
  home.packages = with pkgs; [
    ghq
  ];

  programs.git = {
    extraConfig = {
      ghq = {
        root = "~/src/ghq";
      };
    };
  };
}
