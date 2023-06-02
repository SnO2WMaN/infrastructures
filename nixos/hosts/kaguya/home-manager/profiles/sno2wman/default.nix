{pkgs, ...}: {
  home.stateVersion = "23.05";
  imports = [
    ../../../../../home-manager/alacritty
    ../../../../../home-manager/firefox
    ../../../../remilia/home-manager/modules/bat
    ../../../../remilia/home-manager/modules/bottom
    ../../../../remilia/home-manager/modules/direnv
    ../../../../remilia/home-manager/modules/dogdns
    ../../../../remilia/home-manager/modules/exa
    ../../../../remilia/home-manager/modules/ghq
    ../../../../remilia/home-manager/modules/git
    ../../../../remilia/home-manager/modules/misc/repositories.nix
    ../../../../remilia/home-manager/modules/neovim
    ../../../../remilia/home-manager/modules/rm-improved
    ../../../../remilia/home-manager/modules/starship
    ../../../../remilia/home-manager/modules/zellij
    ../../../../remilia/home-manager/modules/zsh
  ];

  home.packages = with pkgs; [
  ];
}
