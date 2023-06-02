{
  inputs,
  pkgs,
  stylix,
  base16-schemes,
  ...
}: {
  imports = [stylix.nixosModules.stylix];
  stylix.image = pkgs.fetchurl {
    url = "https://freight.cargo.site/t/original/i/b32f61d8058742b67ac706434c3b1aec306e9bb8e640bdc05a70d7f5e509c65d/ED_33.jpg";
    sha256 = "sha256-TrnzJBx7WpKKpskBpBYfnnIfIhlhEQG+7KkSCsMDtsE=";
  };
  stylix.base16Scheme = ./base16.yml;
  stylix.fonts = {
    serif = {
      package = pkgs.noto-fonts-cjk-serif;
      name = "Noto Serif CJK";
    };
    sansSerif = {
      package = pkgs.noto-fonts-cjk-sans;
      name = "Noto Sans CJK";
    };
    monospace = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
