{
  config,
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
  };
  programs.zsh.shellAliases = {
    ze = "zellij";
  };
}
