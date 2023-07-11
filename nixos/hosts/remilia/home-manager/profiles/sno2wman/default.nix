{pkgs, ...}: {
  home.stateVersion = "23.05";
  imports = [
    ../../../../../home-manager/bat
    ../../../../../home-manager/bottom
    ../../../../../home-manager/direnv
    ../../../../../home-manager/dogdns
    ../../../../../home-manager/exa
    ../../../../../home-manager/ghq
    ../../../../../home-manager/git
    ../../../../../home-manager/misc/repositories.nix
    ../../../../../home-manager/neovim
    ../../../../../home-manager/rm-improved
    ../../../../../home-manager/starship
    ../../../../../home-manager/zellij
    ../../../../../home-manager/zsh
    # ../../modules/nix-index
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
    killport # port番号を指定してkillする
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
