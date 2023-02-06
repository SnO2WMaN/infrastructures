{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    rm-improved
  ];
  programs.zsh.shellAliases = {
    rm = "rip";
  };
}
