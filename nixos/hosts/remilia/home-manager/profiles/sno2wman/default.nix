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
    # ../../modules/nix-index
    ../../modules/rm-improved
    ../../modules/starship
    ../../modules/zellij
    ../../modules/zsh
  ];

  home.packages = with pkgs; [
    cargo # Rust用のパッケージマネージャ
    clean-emptydir # 空ディレクトリを再帰的に削除する
    cloc # コード行数のカウント
    du-dust # modern du
    fd # ファイル用のfind
    fzf
    httpie # モダンなcurl
    hyperfine # ベンチマーク用
    jq # JSONの操作
    listgroups # groupsを表示
    listpath # $PATHを:で折り返して表示する
    masscan # モダンなnmap
    nmap
    prettyping # リッチなUIがついたping
    procs # modern ps
    tldr # モダンなman
    tree # ファイル構造を表示
    yq # YAML版jq
  ];
}
