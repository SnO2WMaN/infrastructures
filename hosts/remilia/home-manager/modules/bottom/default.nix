{
  config,
  pkgs,
  ...
}: {
  programs.bottom = {
    enable = true;
    settings = {
      flags = {
        color = "nord";
      };
    };
  };
}
