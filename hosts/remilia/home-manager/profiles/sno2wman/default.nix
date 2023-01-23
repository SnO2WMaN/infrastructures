{pkgs, ...}: {
  home.stateVersion = "23.05";
  imports = [
    ../../modules/bottom
    ../../modules/dogdns
    ../../modules/direnv
    ../../modules/ghq
    ../../modules/git
    ../../modules/starship
    ../../modules/zellij
    ../../modules/zsh
  ];

  home.packages = with pkgs; [
    httpie
    masscan
    nmap
    doas
  ];
}
