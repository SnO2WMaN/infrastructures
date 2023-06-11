{
  config,
  pkgs,
  lib,
  ...
}: {
  home.sessionVariables = {
    XCURSOR_PATH = ".icons";
  };

  xsession.pointerCursor = {
    package = pkgs.breeze-qt5;
    name = "Breeze";
  };

  home.file.".icons/default".source = "${pkgs.breeze-qt5}/share/icons/breeze_cursors";

  home.file.".icons/Breeze".source = "${pkgs.breeze-qt5}/share/icons/breeze_cursors";
}
