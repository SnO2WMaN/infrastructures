{pkgs, ...}: {
  home.stateVersion = "23.05";
  imports = [
    ../../../../../home-manager/alacritty
    ../../../../../home-manager/bat
    ../../../../../home-manager/bottom
    ../../../../../home-manager/direnv
    ../../../../../home-manager/dogdns
    ../../../../../home-manager/eza
    ../../../../../home-manager/firefox
    ../../../../../home-manager/ghq
    ../../../../../home-manager/git
    ../../../../../home-manager/misc/repositories.nix
    ../../../../../home-manager/neovim
    ../../../../../home-manager/rm-improved
    ../../../../../home-manager/starship
    ../../../../../home-manager/zellij
    ../../../../../home-manager/zsh
  ];

  home.packages = with pkgs; [
  ];
}
