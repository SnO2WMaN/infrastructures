{pkgs, ...}: {
  home.packages = with pkgs; [
    dogdns
  ];
  programs.zsh.shellAliases = {
    drill = "dig";
    dig = "dog";
  };
}
