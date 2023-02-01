{pkgs, ...}: let
  # pick repository by fzf & ghq
  repos = pkgs.writeShellApplication {
    name = "repos";
    runtimeInputs = with pkgs; [fzf ghq];
    text = "ghq list -p | fzf --preview \"ls -p {}\"";
  };

  # open repository in VSCode
  coder = pkgs.writeShellApplication {
    name = "coder";
    runtimeInputs = [repos];
    text = "code \"$(repos)\"";
  };
in {
  home.packages = [
    repos
    coder
  ];
}
