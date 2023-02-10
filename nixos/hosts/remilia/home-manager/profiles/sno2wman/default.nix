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
    fd # ファイル用のfind
    fzf
    httpie # モダンなcurl
    hyperfine # ベンチマーク用
    jq # JSONの操作
    masscan # モダンなnmap
    nmap
    prettyping # リッチなUIがついたping
    tldr # モダンなman
    tree # ファイル構造を表示
    yq # YAML版jq
  ];
}
