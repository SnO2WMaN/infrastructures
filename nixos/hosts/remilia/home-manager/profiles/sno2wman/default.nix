{pkgs, ...}: {
  home.stateVersion = "23.05";
  imports = [
    ../../modules/bat
    ../../modules/bottom
    ../../modules/direnv
    ../../modules/dogdns
    ../../modules/exa
    ../../modules/ghq
    ../../modules/git
    ../../modules/misc/repositories.nix
    ../../modules/neovim
    ../../modules/nix-index
    ../../modules/rm-improved
    ../../modules/starship
    ../../modules/zellij
    ../../modules/zsh
  ];

  home.packages = with pkgs; [
    fd # find for files
    fzf
    httpie
    hyperfine # benchmark
    masscan
    nmap
    prettyping # pretty ping
    tldr # modern man pages
    tree # file dir
  ];
}
