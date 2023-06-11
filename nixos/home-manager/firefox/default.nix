{
  config,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    profiles.default = {
      isDefault = true;
      # userChrome = builtins.readFile ./userChrome.css;
      settings = {
        "ui.key.menuAccessKeyFocuses" = false;

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        "browser.fullscreen.autohide" = false;
        "browser.startup.homepage" = "about:home";
        "browser.newtabpage.enabled" = true;
        "browser.startup.page" = 1;

        "extensions.screenshots.disabled" = false;
      };
    };
  };

  home.sessionVariables = {
    BROWSER = "firefox";
    MOZ_ENABLE_WAYLAND = 1;
    MOZ_DBUS_REMOTE = 1;
  };

  xdg.mimeApps = {
    defaultApplications = {
      "x-scheme-handler/ftp" = ["firefox.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
    };
  };
}
